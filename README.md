# India Unemployment SQL Analysis (2019-2021)

## Project Overview

A MySQL-based exploratory analysis of India's unemployment data from 2019 to 2021, covering the pre-COVID baseline and the COVID-19 lockdown period. This project is the SQL companion to my [Python + Pandas EDA](https://github.com/pushkesh-m/india-unemployment-eda) on the same dataset - same questions, different tool.

**Tool:** MySQL  
**Dataset:** [Unemployment in India - Kaggle (gokulrajkmv)](https://www.kaggle.com/datasets/gokulrajkmv/unemployment-in-india)  
**Skills Demonstrated:** Data Exploration, Data Cleaning, GROUP BY, WHERE, HAVING, Subquery

---

## Dataset

| Field | Detail |
|-------|--------|
| Rows | 768 records |
| Columns | Region, Date, Frequency, Unemployment Rate (%), Estimated Employed, Labour Participation Rate (%), Area |
| Coverage | 28 Indian states, 2019 - 2020 |
| Granularity | Monthly, split by Rural and Urban |

---

## Project Structure

```
india-unemployment-sql/
├── README.md
├── schema.sql        -- Table creation, column renames, verification
├── analysis.sql      -- Data exploration, cleaning and 7 analysis queries
└── Data/
    └── unemployment_india.csv
```

---

## Analysis Breakdown

### Section 1 - Data Exploration
- Total row count and data preview
- Distinct states and areas
- Date range of the dataset
- Null checks on key columns

### Section 2 - Data Cleaning
- Duplicate row check
- Date format verification
- Unemployment rate range and outlier check

### Section 3 - Analysis Queries

| # | Query | Concepts |
|---|-------|----------|
| 1 | Top 10 states by average unemployment rate | GROUP BY, AVG, ORDER BY |
| 2 | National monthly trend - COVID wave | SUBSTRING, GROUP BY |
| 3 | Rural vs Urban comparison | GROUP BY, AVG |
| 4 | Pre-COVID unemployment by state | WHERE, SUBSTRING |
| 5 | Hardest hit states during COVID peak (Apr-May 2020) | WHERE, IN, SUBSTRING |
| 6 | Most resilient states during COVID | WHERE, ORDER BY ASC |
| 7 | States above the national average | HAVING, Subquery |

---

## Key Findings

- Haryana, Tripura and Jharkhand had the highest average unemployment rates overall
- National unemployment spiked sharply in April-May 2020, crossing 20%+ during peak lockdown
- Urban unemployment was consistently higher than rural, and the gap widened during COVID
- States like Meghalaya and Odisha showed lower rates during COVID, suggesting stronger rural labour absorption
- Around 15 out of 28 states had unemployment rates above the national average

---

## How to Run

1. Clone this repo
2. Download the CSV from [Kaggle](https://www.kaggle.com/datasets/gokulrajkmv/unemployment-in-india) and place in `/Data`
3. Run `schema.sql` in MySQL Workbench - creates the table
4. Import the CSV using the Table Data Import Wizard
5. Run the column rename queries in `schema.sql`
6. Run `analysis.sql` - execute each query individually

---

## Related Projects

- [India Unemployment EDA - Python + Pandas](https://github.com/pushkesh-m/india-unemployment-eda)
- [Layoffs Analysis - SQL](https://github.com/pushkesh-m)
- [Bike Sales Dashboard - Excel](https://github.com/pushkesh-m)
