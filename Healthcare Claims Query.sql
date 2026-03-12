SELECT
  COUNT(*) AS total_claims,
  SUM(`Billed Amount`) AS total_billed_revenue,
  SUM(`Paid Amount`) AS total_paid_revenue,
  SUM(`Denied Amount`) AS total_denied_revenue,
  AVG(`Days in AR`) AS avg_days_in_ar
FROM `sylvan-weft-470315-n8.healthcare_claims.Healthcare Claims`;

SELECT
  `Insurance Type`,
  SUM(`Denied Amount`) AS total_denied_revenue,
  COUNT(*) AS denied_claims
FROM `sylvan-weft-470315-n8.healthcare_claims.Healthcare Claims`
WHERE `Claim Status` = 'Denied'
GROUP BY `Insurance Type`
ORDER BY total_denied_revenue DESC;

SELECT
  `Denial Reason`,
  COUNT(*) AS denial_count,
  SUM(`Denied Amount`) AS financial_impact
FROM `sylvan-weft-470315-n8.healthcare_claims.Healthcare Claims`
WHERE `Claim Status` = 'Denied'
GROUP BY `Denial Reason`
ORDER BY denial_count DESC;

SELECT
  Facility,
  SUM(`Billed Amount`) AS total_billed,
  SUM(`Paid Amount`) AS total_paid,
  SUM(`Denied Amount`) AS total_denied
FROM `sylvan-weft-470315-n8.healthcare_claims.Healthcare Claims`
GROUP BY Facility
ORDER BY total_paid DESC;

SELECT
  `Aging Bucket`,
  COUNT(*) AS claim_count,
  SUM(Balance) AS outstanding_balance
FROM `sylvan-weft-470315-n8.healthcare_claims.Healthcare Claims`
GROUP BY `Aging Bucket`
ORDER BY claim_count DESC;

SELECT
  DATE_TRUNC(`Date of Service`, MONTH) AS service_month,
  SUM(`Paid Amount`) AS monthly_revenue
FROM `sylvan-weft-470315-n8.healthcare_claims.Healthcare Claims`
GROUP BY service_month
ORDER BY service_month;

SELECT
  `Claim ID`,
  Facility,
  `Insurance Type`,
  Balance,
  `Days in AR`
FROM `sylvan-weft-470315-n8.healthcare_claims.Healthcare Claims`
WHERE `Days in AR` > 90
ORDER BY `Days in AR` DESC;

WITH payer_revenue AS (
  SELECT
    `Insurance Type` AS payer,
    SUM(`Billed Amount`) AS total_billed,
    SUM(`Paid Amount`) AS total_paid,
    SUM(`Denied Amount`) AS total_denied
  FROM `sylvan-weft-470315-n8.healthcare_claims.Healthcare Claims`
  GROUP BY payer
),

payer_leakage AS (
  SELECT
    payer,
    total_billed,
    total_paid,
    total_denied,
    total_billed - total_paid AS revenue_leakage,
    SAFE_DIVIDE(total_denied, total_billed) * 100 AS denial_percentage
  FROM payer_revenue
)

SELECT
  payer,
  total_billed,
  total_paid,
  total_denied,
  revenue_leakage,
  denial_percentage,
  RANK() OVER (ORDER BY revenue_leakage DESC) AS leakage_rank
FROM payer_leakage
ORDER BY leakage_rank;

WITH claim_financials AS (
  SELECT
    `Claim ID`,
    Facility,
    `Insurance Type`,
    `Billed Amount`,
    `Paid Amount`,
    `Denied Amount`,
    (`Billed Amount` - `Paid Amount`) AS revenue_leakage
  FROM `sylvan-weft-470315-n8.healthcare_claims.Healthcare Claims`
),

ranked_claims AS (
  SELECT
    *,
    PERCENT_RANK() OVER (ORDER BY revenue_leakage DESC) AS risk_percentile
  FROM claim_financials
)

SELECT
  `Claim ID`,
  Facility,
  `Insurance Type`,
  `Billed Amount`,
  `Paid Amount`,
  `Denied Amount`,
  revenue_leakage,
  risk_percentile
FROM ranked_claims
WHERE risk_percentile <= 0.10
ORDER BY revenue_leakage DESC;