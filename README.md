
-----

# Bank Loan Data Analysis Using SQL

This project performs a comprehensive analysis of bank loan data to assess financial performance, risk management, and client demographics. The analysis utilizes SQL for data manipulation (creating Views and Stored Procedures) and Excel/CSV data for deriving key performance indicators (KPIs) such as delinquency rates, total revenue, and regional funding distribution.

## Objective

The objective of this project is to analyze banking transaction and loan data to generate insights such as:

  - **Financial Health:** Total Funded Amounts vs. Total Collections.
  - **Risk Assessment:** Delinquency and Default rates among borrowers.
  - **Demographic Analysis:** Loan distribution by Religion, Age Group, and Region.
  - **Operational Efficiency:** Analysis of Active vs. Closed clients.
  - **Product Benchmarking:** Performance of different loan purposes (e.g., Home Loans, Agriculture).

## Tech Stack

- **Database:** MySQL / SQL Server
- **ETL/Data Import:** Data imported via **SQL Import Wizard** (from Excel/CSV to Database).
- **SQL Features:**
    - `CREATE DATABASE` & `USE`
    - `CREATE VIEW` for dynamic KPI reporting
    - `STORED PROCEDURES` for reusable analysis logic
    - Aggregations (`SUM`, `COUNT`, `AVG`) and Conditional Logic (`CASE` statements)

-----

# Dataset Description

The dataset comprises comprehensive loan details, client demographics, and repayment status.

## Dataset Structure

  - **Total Records:** \~65,535 Loans
  - **Primary Data Sources:** `Bank Data Analysis.xlsx` (Raw Data, Pivot Tables, Revenue Data).

## Key Column Description

| Column Name | Description |
|---|---|
| **Account ID** | Unique identifier for each loan account. |
| **Loan Amount** | The amount of money applied for by the borrower. |
| **Funded Amount** | The actual amount disbursed by the bank. |
| **Loan Status** | Current status of the loan (e.g., Active, Fully Paid, Cancelled). |
| **Int Rate** | Interest rate charged on the loan. |
| **Region / State** | Geographical location of the borrower (e.g., Uttar Pradesh, Punjab). |
| **Purpose Category** | The reason for the loan (e.g., Services, Agriculture, Home Loan). |
| **Is Delinquent** | Flag (Y/N) indicating if the loan is delinquent. |
| **Is Default** | Flag (Y/N) indicating if the borrower has defaulted. |
| **Religion / Caste** | Demographic details for diversity analysis. |

-----

# SQL Queries and Insights

The project utilizes specific SQL structures to automate insight generation.

## 1\. KPI Reporting (SQL View)

### Output Summary

| Metric | Value |
|---|---|
| **Total Funded Amount** | 732.7 M |
| **Total Loans** | 65,535 |
| **Total Collections** | 808.3 M |
| **Total Interest Earned** | 155.3 M |

### Insight

  - The bank has a healthy collection ratio, with Total Collections (808M) exceeding Total Funded Amount (732M), indicating profitability through interest (155M).

-----

## 2\. Risk Analysis: Delinquency & Defaults

### Output Summary

| Status | Count | Rate (%) |
|---|---|---|
| **Delinquent Loans** | 7,106 | 10.84% |
| **Default Loans** | 1,020 | 1.56% |

### Insight

  - **Delinquency:** A delinquency rate of \~10.8% suggests a significant portion of borrowers are delaying payments, requiring tighter follow-up mechanisms.
  - **Default:** The default rate is relatively low at 1.56%, indicating that while payments are delayed, most capital is eventually recovered.

-----

## 3\. Regional Performance (State-wise Analysis)

### Output Summary (Top States)

| State Name | Funded Amount (Approx) |
|---|---|
| **Uttar Pradesh** | 135.4 M |
| **Punjab** | 115.9 M |
| **Bihar** | 93.3 M |
| **Haryana** | 78.8 M |

### Insight

  - **Uttar Pradesh** is the largest market, commanding the highest share of funded amounts.
  - **Action:** Regional managers in UP and Punjab should focus on maintaining asset quality given the high exposure.

-----

## 4\. Product Category Benchmarking

### Output Summary

| Purpose Category | Key Insight |
|---|---|
| **Home Loan** | 271 M |
| **Services** | 152 M |
| **Agriculture** | 36 M |
| **Business** | 80 M |

### Insight

  - **Home Loans** dominate the portfolio (approx. 37% of total funding), which typically carries lower risk but longer tenures.
  - **Services** and **Business** loans show strong demand, vital for short-to-medium term revenue generation.

-----

# Key Insights

### 1\. Demographic Distribution

The loan portfolio is diversified across different communities, with the **Hindu** demographic constituting the largest share (549M), followed by **Sikh** (98M) and **Muslim** (78M) communities.

### 2\. Loan Status Breakdown

  - **Active Loans:** 401 M (The majority of capital is currently in circulation).
  - **Fully Paid:** 187 M (Demonstrates a solid track record of repayment).
  - **Write Off:** 1.1 M (Minimal losses relative to the total portfolio).

### 3\. Interest Income

The total interest earned stands at **155M**, which is approximately **21%** of the total funded amount, identifying a healthy yield on the loan portfolio.

### 4\. Delinquency Correlation

Analysis suggests that specific regions or product types (like "Services") may have higher correlations with delinquency compared to secured loans like "Home Loans".

-----

# Recommendations

### 1\. Risk Mitigation in High-Exposure States

With **Uttar Pradesh** and **Punjab** holding the bulk of the loan book, specialized collection teams should be deployed in these regions to manage the 10% delinquency risk effectively.

### 2\. Product Focus

Continue to aggressively market **Home Loans** as they anchor the portfolio. However, tighter credit checks are recommended for **Business** and **Services** loans where cash flow volatility is higher.

### 3\. Delinquency Management

Implement an early warning system for the **7,106 delinquent accounts**. Converting these "late payers" back to "regular payers" is critical to preventing them from sliding into the "Default" category.

### 4\. Data-Driven Recovery

Use the **KPI\_Report** View to monitor the *Active* vs. *Closed* client ratio weekly to ensure the bank's customer base remains net positive.

