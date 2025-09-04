# 🏦 Bank Loan Report – SQL + Power BI Project

This project analyzes a **financial loans dataset** using **SQL Server** and visualizes it with **Power BI**.  
The goal is to track loan portfolio health, good vs bad loans, and borrower trends.

---

## 📊 Key Matrics
- **Total Loan Applications:** 
- **Total Funded Amount** 
- **Total Amount Received** 
- **Average Interest Rate** 
- **Average DT**  
- **Good Loans** | **Bad Loans** 

---

## 🗄️ SQL Part
I used SQL to calculate KPIs such as:
- Total Applications, Funded Amount, and Amount Received
- Average Interest Rate & DTI
- Good Loan % vs Bad Loan %
- Loan breakdown by **Status, Month, State, Term, Employee Length, Purpose, Home Ownership**

**Example:**
```sql
-- Good Loan Percentage
SELECT COUNT(CASE WHEN loan_status IN ('Fully Paid','Current') THEN id END)*100.0/COUNT(id) AS Good_Loan_Percentage
FROM financial_loan;

