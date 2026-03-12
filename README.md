# healthcare-revenue-cycle-analysis
Healthcare Revenue Cycle Intelligence Analysis

Project Overview

This project analyzes healthcare claims data to identify revenue cycle inefficiencies, payer reimbursement trends, denial drivers, and accounts receivable (A/R) risk across multiple infusion facilities.

The objective of the analysis was to simulate how healthcare organizations can leverage data analytics and business intelligence to reduce revenue leakage, improve reimbursement performance, and accelerate cash flow.

Dataset analyzed:

13,000 healthcare claims

3 infusion facilities

Multiple commercial and government payers

Financial metrics including billed, allowed, and paid amounts

Business Problem

Healthcare providers frequently experience revenue loss due to claim denials, delayed reimbursements, and operational inefficiencies in the revenue cycle.

Leadership requires better visibility into:

Payer denial patterns

Reimbursement delays

High-risk accounts receivable

Operational bottlenecks affecting claims processing

Tools Used

SQL – data analysis and aggregation

Excel – data preparation and exploration

Power BI / Tableau – dashboard visualization

GitHub – documentation and project presentation

Dataset Structure

Key fields analyzed:

Field	Description

Claim_ID	Unique claim identifier

Facility	Infusion center location

Payer_Name	Insurance payer

Billed_Amount	Total billed charge

Allowed_Amount	Contractually allowed charge

Paid_Amount	Reimbursement received

Denial_Flag	Indicates denied claim

Denial_Reason	Cause of denial

Days_in_AR	Accounts receivable aging

Key Performance Metrics
Metric	Value
Total Claims	13,000
Total Billed Revenue	$814.3M
Total Paid Revenue	$470.7M
Total Denied Revenue	$76.7M
Denial Rate	~9.4%
Average Days in AR	~144 days

Key Insights
1. Commercial Payers Drive the Majority of Denied Revenue

The highest denial impact was observed among the following payers:

Payer	Denied Revenue
UnitedHealthcare	$14.4M
Blue Cross Blue Shield	$13.5M
Cigna	$10.5M
Aetna	$9.8M
Humana	$9.7M

2. Operational Workflow Gaps Contribute to Denials

Top denial drivers included:

Missing prior authorizations

Eligibility verification failures

Duplicate claim submissions

Documentation errors

Improving front-end verification processes could significantly reduce preventable denials.

3. High Accounts Receivable Risk

A significant portion of claims remain unresolved beyond 120 days in A/R, increasing the risk of delayed or lost revenue.

Targeted follow-up on aging claims could improve reimbursement timelines.

Dashboard

Example dashboard pages include:

Executive Revenue Overview

Payer Performance Analysis

Denial Intelligence

Accounts Receivable Aging

Example visualization:

dashboard/dashboard_screenshot.png

Business Recommendations

Based on the analysis, the following initiatives could improve financial performance:

Improve authorization workflows

Authorization-related denials represent a major source of revenue leakage.

Enhance eligibility verification

Front-end insurance validation can prevent avoidable denials.

Prioritize aging claims follow-up

Targeting claims older than 90 days can accelerate revenue recovery.

Develop payer-specific mitigation strategies

Focusing on high-impact payers could reduce overall denial rates.

Project Deliverables

Included in this repository:

Dataset used for analysis

SQL queries used to generate insights

Executive summary report

Dashboard visualizations

Author

Justin Clark
Healthcare Data Analytics Portfolio

LinkedIn:
[Add your LinkedIn link here](https://www.linkedin.com/in/justin-clark-16176467/)
