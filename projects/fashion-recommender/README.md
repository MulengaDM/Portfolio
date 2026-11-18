# Session-based fashion recommender (RecSys Challenge 2022)

University pair project (Open Innovations in Data Science), 2024–25.

## Problem
Predict the item a shopper buys using only the items they viewed in one session. Most visitors are new, so there's no purchase history to go on.

## Approach
- Cleaned and filtered the Dressipi session data and converted views into implicit feedback.
- Used candidate filtering and dynamic exclusions so new items could still be recommended.
- Trained an item-based collaborative filtering model (KNNBasic, Surprise library) and compared it with a random baseline.

## Results
Mean reciprocal rank (MRR) of 0.456 on validation data, and precision@10 of 0.62.

## Notebooks
| Notebook | What it does |
| --- | --- |
| [data_analysis.ipynb](notebooks/data_analysis.ipynb) | Explores the sessions, purchases and item features |
| [data_preprocessing_part2.ipynb](notebooks/data_preprocessing_part2.ipynb) | Cleaning and feature preparation |
| [recommender_1.ipynb](notebooks/recommender_1.ipynb) | First recommender build and evaluation |
| [RecSys_2.ipynb](notebooks/RecSys_2.ipynb) | Refined recommender |

## Data
The notebooks read the [Dressipi RecSys Challenge 2022 dataset](https://www.dressipi-recsys-challenge.com/) from Google Drive (`/content/drive/MyDrive/`). The dataset isn't included here. To run the notebooks, download it and update the paths.

**Tools:** Python, pandas, Surprise, Google Colab
