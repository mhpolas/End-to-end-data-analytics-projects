------Total Loan Applications-----
SELECT COUNT(DISTINCT ID) AS total_application FROM financial_loan;

------Month-To-Date Loan Applications.------
-- It’s the count of all loan applications received so far in the current month.--
SELECT COUNT(id) as MTD_Application FROM financial_loan
WHERE MONTH(issue_date) = MONTH(GETDATE());

------ PMTD Loan Applications ------
-- It’s the count of all loan applications received in the PREVIOUS month.--
SELECT COUNT(id) as PMTD_Application FROM financial_loan
WHERE MONTH(issue_date) = MONTH(GETDATE()) -1;

-----Total Funded Amount-----
-----the sum of ALL the loan_amount-----
SELECT SUM(loan_amount) as Total_Funded_Amount FROM financial_loan;

---MTD Total Funded Amount---
SELECT SUM(loan_amount) as MTD_Funded_Amount FROM financial_loan
WHERE MONTH(issue_date) = MONTH(GETDATE());

---pMTD Total Funded Amount---
SELECT SUM(loan_amount) as pMTD_Funded_Amount FROM financial_loan
WHERE MONTH(issue_date) = MONTH(GETDATE())-1;

--- Total Amount Received---
--- The sum of all repayments collected ---

SELECT SUM(total_payment) AS Total_Amount_Received
FROM financial_loan;


--- MTD Total Amount Received---
SELECT SUM(total_payment) AS MTD_Amount_Received
FROM financial_loan
WHERE MONTH(issue_date) = MONTH(GETDATE());


--- PMTD Total Amount Received---
SELECT SUM(total_payment) AS PMTD_Amount_Received
FROM financial_loan
WHERE MONTH(issue_date) = MONTH(GETDATE())-1;

---Average Interest Rate---
SELECT AVG(int_rate) AS Avg_int_rate
FROM financial_loan ;

---MTD Average Interest Rate---
SELECT AVG(int_rate) AS MTD_Avg_int_rate
FROM financial_loan
WHERE MONTH(issue_date) = MONTH(GETDATE());

---MTD Average Interest Rate---
SELECT AVG(int_rate) AS PMTD_Avg_int_rate
FROM financial_loan
WHERE MONTH(issue_date) = MONTH(GETDATE())-1;

-----Avg DTI (Debt-to-Income ratio)-----
SELECT AVG(dti) AS Avg_DTI_Pct
FROM financial_loan;

----MTD Avg DTI----

SELECT AVG(dti) AS MTD_Avg_DTI_Pct
FROM financial_loan
WHERE MONTH(issue_date) = MONTH(GETDATE());

----PMTD Avg DTI----
SELECT AVG(dti) AS PMTD_Avg_DTI_Pct
FROM financial_loan
WHERE MONTH(issue_date) = MONTH(GETDATE())-1;


----------------GOOD LOAN ISSUED-----------
-------------------------------------------

----- Good Loan Percentage ------
SELECT COUNT(CASE WHEN loan_status IN('Fully Paid', 'Current')
THEN id END)*100/COUNT(id) AS Good_Loan_Percentage
FROM financial_loan;

----- Good Loan Application ------

SELECT COUNT(id) AS Good_Loan_Application  from financial_loan
WHERE loan_status IN('Fully Paid', 'Current');



----- Good Loan Funded Amount ------

SELECT SUM(loan_amount)  AS Good_Loan_Funded_Amount FROM financial_loan
WHERE loan_status IN('Fully Paid', 'Current');

----- Good Loan Amount Recieved ------
SELECT SUM(total_payment) AS Good_Loan_Amount_Recieved FROM financial_loan
WHERE loan_status IN('Fully Paid', 'Current');

----------------bad LOAN ISSUED-----------
------------------------------------------

---------Bad Loan Percentage ---------
SELECT COUNT(CASE WHEN loan_status='Charged Off' THEN id END)*100/COUNT(id) AS Bad_Loan_Percentage 
FROM financial_loan;

---------Bad Loan Application --------
SELECT COUNT(id) as Bad_Loan_Application from financial_loan
where loan_status='Charged Off';

---------Bad Loan Funded Amount  --------
SELECT SUM(loan_amount)  AS Bad_Loan_Funded_Amount from financial_loan
where loan_status='Charged Off';

---------Bad Loan Amount Received   --------
SELECT SUM(total_payment)  AS  Bad_Loan_amount_received from financial_loan
where loan_status='Charged Off';

----------------LOAN STATUS-----------
--------------------------------------
SELECT 
        loan_status, 
        COUNT(id) AS LoanCount, 
        SUM(total_payment) AS Total_Amount_Received, 
        SUM(loan_amount) AS Total_Funded_Amount, 
        AVG(int_rate) AS Interest_Rate, 
        AVG(dti) AS DTI 
    FROM 
        financial_loan
    GROUP BY 
        loan_status ;

-----MTD BY LOAN STATUS------

SELECT  
 loan_status,  
 SUM(total_payment) AS MTD_Total_Amount_Received,  
 SUM(loan_amount) AS MTD_Total_Funded_Amount  
FROM financial_loan
WHERE MONTH(issue_date) = MONTH(GETDATE())
GROUP BY loan_status 




----------------BANK LOAN REPORT | OVERVIEW-----------
------------------------------------------------------
---Report by month---

SELECT  
    MONTH(issue_date) AS Month_Number,  
    DATENAME(MONTH, issue_date) AS Month_name,  
    COUNT(id) AS Total_Loan_Applications, 
    SUM(loan_amount) AS Total_Funded_Amount, 
    SUM(total_payment) AS Total_Amount_Received 
FROM financial_loan
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date) 
ORDER BY MONTH(issue_date) 

---Report by State---

SELECT  
    address_state AS State,  
    COUNT(id) AS Total_Loan_Applications, 
    SUM(loan_amount) AS Total_Funded_Amount, 
    SUM(total_payment) AS Total_Amount_Received 
FROM financial_loan
GROUP BY address_state 
ORDER BY address_state 



---Report by TERM---

SELECT  
    term AS Term,  
    COUNT(id) AS Total_Loan_Applications, 
    SUM(loan_amount) AS Total_Funded_Amount, 
    SUM(total_payment) AS Total_Amount_Received 
FROM financial_loan
GROUP BY term 
ORDER BY term ;


---Report by eMPLOYEE LENGHT---

SELECT  
    emp_length AS Employee_Length,  
    COUNT(id) AS Total_Loan_Applications, 
    SUM(loan_amount) AS Total_Funded_Amount, 
    SUM(total_payment) AS Total_Amount_Received 
FROM financial_loan
GROUP BY emp_length 
ORDER BY emp_length ;

---Report by pURPOSE---

SELECT  
    purpose AS PURPOSE,  
    COUNT(id) AS Total_Loan_Applications, 
    SUM(loan_amount) AS Total_Funded_Amount, 
    SUM(total_payment) AS Total_Amount_Received 
FROM financial_loan
GROUP BY purpose 
ORDER BY purpose ;

---Report by HOME OWNERSHIP---

SELECT  
home_ownership AS Home_Ownership,  
COUNT(id) AS Total_Loan_Applications, 
SUM(loan_amount) AS Total_Funded_Amount, 
SUM(total_payment) AS Total_Amount_Received 
FROM financial_loan
GROUP BY home_ownership 
ORDER BY home_ownership 