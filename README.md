# Payroll & Workforce Cost Analytics Dashboard

## Project Overview
This project is an **end-to-end payroll analytics solution** that consolidates employee, salary, and attendance data to generate actionable insights for HR and Finance teams. It includes a **PostgreSQL database**, **SQL view with payroll logic**, and an **interactive Power BI dashboard** for annual payroll and workforce analysis.

---

## Objective
- Automate payroll reporting for **999 employees**.
- Analyze **total payroll, average salary, overtime cost**, and **department-wise headcount**.
- Enable data-driven decision-making using interactive visualizations.
- Reduce errors and manual calculations compared to raw Excel files.

---

## Tools & Technologies
- **Database:** PostgreSQL  
- **Data Preparation:** Microsoft Excel  
- **Visualization:** Power BI Desktop  
- **Data Format:** Structured Excel files for bulk import (Employee Details, Salary Details, Attendance Details)  
- **Language / Queries:** SQL, DAX

---

## Data Preparation
1. Created **3 structured Excel datasets**:
   - `Employee_details.xlsx` – Employee ID, Name, Department, Designation, Type, Date of Joining
   - `Salary_details.xlsx` – Employee ID, Basic Salary, HRA, Allowances, Gross Salary
   - `Attendance_details.xlsx` – Employee ID, Working Days, Days Present, Overtime Hours
2. Imported these datasets into **PostgreSQL** using `COPY` and `\copy` commands.
3. Ensured **clean data types** (Date, Numeric, Integer) for smooth analysis.

---

## Database Design
- **Tables:**
  - `employee_details`
  - `salary_details`
  - `attendance_details`
- **View:** `payroll_view`  
  Consolidates all tables and calculates **attendance-adjusted salary, overtime pay, and deductions** for accurate net pay.

---

- Overtime pay calculated at a **fixed hourly rate**.
- Net pay is the **basis for all KPIs** and the Power BI dashboard.

---

## Power BI Dashboard
- **KPIs:**
  - Total Payroll (~₹60,00,000/year)
  - Average Salary (~₹50,000/month)
  - Total Overtime Hours (2,000+/month)
  - Department-wise Headcount
- **Slicers:** Department, Employee Type
- **Visuals:**
  - Bar charts for payroll by department
  - Tables for employee-level salary
  - Donut chart for employee type distribution
  - KPI cards for quick insights
- Interactive dashboard allows **filtering by department or employee type**, enabling **cost-center level analysis**.

---

## Outcome & Impact
- Enabled **HR and Finance teams** to quickly assess payroll costs and workforce distribution.
- Centralized business logic in SQL, **reducing errors by 100%** compared to manual Excel processing.
- Provides a **professional, annual payroll overview** for 999 employees, including overtime and deductions.

---


 
