# Beyond Averages: A Multidimensional Analysis of Public Acceptance of 
# Algorithmic Personalization Using Item Response Theory

## Author
Louisa Schiefer
Bachelor of Data and Business Analytics, IE University
Supervised by: Andrea Cremaschi
April 2026

---

## Overview
This repository contains all R analysis scripts used in the thesis. The 
analysis applies Item Response Theory (IRT) to cross-national survey data 
from Germany, Great Britain, and the United States (N = 3,216) to model 
public acceptability of algorithmic personalization as a multidimensional 
latent construct.

---

## Repository Structure

source.R                  # Global setup: packages, themes, colour palettes
build_data.qmd            # Data loading, cleaning, and preprocessing
EDA_final.qmd             # Exploratory data analysis
UNIdimensional.qmd        # Unidimensional GRM and PCM model estimation
Test_MULTIdim.qmd         # Multidimensional GRM, invariance testing, DIF
Test_Regression.qmd       # OLS regression and MANOVA
Test_Clustering.qmd       # K-means clustering on 3D theta scores
MIMIC.qmd                 # MIMIC model as robustness check
dalia_vars.csv            # Item dictionary mapping variables to dimensions

---

## How to Run

All scripts must be run in the following order, as each depends on 
outputs from the previous step:

1. source.R
   - Run first, at the start of every session
   - Installs and loads all required packages
   - Defines colour palettes and ggplot themes used across all scripts

2. build_data.qmd
   - Loads raw data files (data_GER.csv, data_GB_US.csv)
   - Standardises column names using dalia_vars.csv
   - Recodes variables and stores ordered factors
   - Saves cleaned dataset as data/bundle.rds

3. EDA_final.qmd
   - Requires: data/bundle.rds
   - Produces descriptive statistics, skewness plots, correlation heatmap,
     parallel analysis, and EFA
   - Outputs saved to results/

4. UNIdimensional.qmd
   - Requires: data/bundle.rds
   - Fits unidimensional GRM and PCM
   - Compares models using AIC, BIC, and likelihood ratio tests
   - Extracts theta scores and saves to results/fit_grm.rds
     and results/data_with_theta.csv

5. Test_MULTIdim.qmd
   - Requires: data/bundle.rds, results/fit_grm.rds
   - Fits 2D and 3D GRM models
   - Tests measurement invariance (configural, metric, scalar)
   - Runs slope and threshold DIF analysis
   - Saves final dataset with all theta scores to 
     results/data_final_all_thetas.rds

6. Test_Regression.qmd
   - Requires: results/data_final_all_thetas.rds
   - Fits unidimensional and multivariate OLS regression models
   - Tests joint significance using MANOVA
   - Saves coefficients and R² to results/

7. Test_Clustering.qmd
   - Requires: results/data_final_all_thetas.rds
   - Runs k-means clustering (k = 3) on 3D theta scores
   - Validates cluster profiles against country, gender, education,
     and privacy concern
   - Saves cluster assignments to results/cluster_assignments.csv

8. MIMIC.qmd
   - Requires: data/bundle.rds, results/fit_grm.rds
   - Estimates unidimensional and three-dimensional MIMIC models
   - Compares MIMIC coefficients with OLS results from step 6

---

## Software Requirements

- R version 4.5.2
- Quarto (for rendering .qmd files)

Required R packages (installed automatically via source.R):
- mirt 1.45.1        — IRT model estimation
- psych 2.5.6        — polychoric correlations, alpha, parallel analysis
- dplyr 2.2.1        — data manipulation
- janitor 4.0.1      — column name cleaning
- ggplot2            — all visualisations
- tidyverse          — general data wrangling
- patchwork          — combining plots
- cluster            — silhouette analysis for clustering
- broom              — tidying regression output

---

## Data

Raw data files (data_GER.csv, data_GB_US.csv) are NOT included in this 
repository per submission guidelines. They are publicly available via the 
Open Science Framework:

Kozyreva, A., Lorenz-Spreen, P., Hertwig, R., Lewandowsky, S., & Herzog, S. M. 
(2021). Public attitudes towards algorithmic personalization and use of personal 
data online: evidence from Germany, Great Britain, and the United States. 
Humanities and Social Sciences Communications, 8, 117.
https://doi.org/10.1057/s41599-021-00787-w

The item dictionary (dalia_vars.csv) is included as it is required for 
variable naming and dimension grouping in build_data.qmd.

---

## Output

Running all scripts in order produces the following key outputs in results/:

- fit_grm.rds / fit_3d.rds        — saved IRT model objects
- data_final_all_thetas.rds       — full dataset with all theta scores
- comparison_1d_2d_3d.csv         — model fit comparison table
- dimension_correlations.csv      — inter-dimension correlations
- theta_3d_by_country.csv         — mean theta scores by country
- regression_combined.csv         — regression coefficients
- cluster_assignments.csv         — cluster membership per respondent
- plot*.pdf                       — all figures used in the thesis