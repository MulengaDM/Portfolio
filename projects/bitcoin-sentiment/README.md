# Does social media move Bitcoin? (final-year dissertation)

University of Portsmouth, BSc Data Science and Analytics, 2025. Graded 70%.

## Question
Do FOMO and FUD on Twitter, especially from high-follower accounts, change Bitcoin's returns, trading volume or volatility?

## Method
- Collected 3.2 million Bitcoin tweets (February–June 2022) through the Twitter API.
- Labelled tweets as FOMO, neutral or FUD with Cardiff NLP's Twitter RoBERTa sentiment model.
- Weighted sentiment by follower count to build daily and four-hourly indices.
- Tested against market data with correlation, Granger causality, GARCH, EGARCH and GJR-GARCH models, and an event study (±3 days) around the Terra crash and the US Fed rate rise.

## Findings
- At the daily level, sentiment had almost no link to returns (ρ ≈ 0.03), and it added no explanatory power for volatility.
- At a four-hour lag there was a weak signal (p ≈ 0.07).
- Around major news, cumulative abnormal returns fell sharply: −0.40 by three days after the Fed rate rise, and −0.23 after the Terra crash.

## Files
- [dissertation_report.pdf](dissertation_report.pdf): the full report.
- The analysis notebooks aren't included yet.

**Tools:** Python, pandas, NumPy, NLTK, Hugging Face Transformers, Matplotlib, Seaborn, Google Colab
