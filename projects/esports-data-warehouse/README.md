# Esports data warehouse analytics (Business Analytics module)

University of Portsmouth, 2025. The module case study is "Tior Games", an esports and gaming company with a star-schema data warehouse (fact and dimension tables).

## What the SQL answers
Each query in [`sql/`](sql) targets a business question, using window functions, `RANK()`, common table expressions and roll-ups:

| Query | Business question |
| --- | --- |
| [query_1.sql](sql/query_1.sql) | Which champions have the highest average kills, deaths and assists (KDA) in World Championships, to guide game balance? |
| [query_2.sql](sql/query_2.sql) | Which event periods drive the most online merchandise sales? |
| [query_3.sql](sql/query_3.sql) | Which promotions bring in the most revenue on average? |
| [query_4.sql](sql/query_4.sql) | Which champions are bought most, and what share of sales does each contribute? |
| [query_5.sql](sql/query_5.sql) | How does each event perform financially? |
| [query_6.sql](sql/query_6.sql) | Which refund types are most common, ranked and as a percentage of the total? |

[question_2_code.ipynb](question_2_code.ipynb) holds the Python work for the module's second question.

**Tools:** SQL Server (T-SQL), OLAP concepts, Python (pandas)
