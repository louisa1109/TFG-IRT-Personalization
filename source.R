# source.R
# Purpose: load packages + set global options + fixed palettes + scale helpers
# Source this at the top of EVERY script: source("source.R")

# =============================================================================
# 1) PACKAGES
# =============================================================================

packages <- c(
  # Data wrangling
  "tidyverse", "janitor", "forcats", "stringr",
  # Descriptive / EDA
  "psych", "skimr",
  # IRT models and plots
  "mirt", "ggmirt",
  # Regression helpers
  "broom",
  # Reporting / layout
  "knitr", "patchwork"
)

to_install <- packages[!packages %in% rownames(installed.packages())]
if (length(to_install) > 0) install.packages(to_install)
invisible(lapply(packages, library, character.only = TRUE))

# =============================================================================
# 2) GLOBAL OPTIONS
# =============================================================================

options(scipen = 999, stringsAsFactors = FALSE)
theme_set(theme_minimal(base_size = 12))

# =============================================================================
# 3) BASE THESIS PALETTE
# =============================================================================

palette_thesis <- c(
  slate    = "#5E6C84",
  teal     = "#6BAED6",
  sage     = "#74C69D",
  sand     = "#E9C46A",
  rose     = "#E5989B",
  mauve    = "#B5838D",
  lavender = "#8E9AAF"
)

scale_colour_thesis <- function(...) ggplot2::scale_colour_manual(values = palette_thesis, ...)
scale_fill_thesis   <- function(...) ggplot2::scale_fill_manual(values = palette_thesis, ...)

# =============================================================================
# 4) COUNTRY PALETTE  — ALWAYS same mapping across ALL scripts
# =============================================================================
#   GER = slate (#5E6C84)  |  GB = teal (#6BAED6)  |  US = rose (#E5989B)

palette_country <- c(
  GER = unname(palette_thesis["slate"]),
  GB  = unname(palette_thesis["teal"]),
  US  = unname(palette_thesis["rose"])
)

scale_colour_country <- function(...) {
  ggplot2::scale_colour_manual(values = palette_country, breaks = names(palette_country), ...)
}
scale_fill_country <- function(...) {
  ggplot2::scale_fill_manual(values = palette_country, breaks = names(palette_country), ...)
}

# =============================================================================
# 5) RESPONSE PALETTE  — ALWAYS same mapping across ALL scripts
# =============================================================================
#   "Not acceptable at all" = sage   | "Not very acceptable" = sand
#   "Somewhat acceptable"   = mauve  | "Very acceptable"     = lavender

palette_response <- c(
  "Not acceptable at all" = unname(palette_thesis["sage"]),
  "Not very acceptable"   = unname(palette_thesis["sand"]),
  "Somewhat acceptable"   = unname(palette_thesis["mauve"]),
  "Very acceptable"       = unname(palette_thesis["lavender"])
)

scale_fill_response <- function(...) {
  ggplot2::scale_fill_manual(values = palette_response, breaks = names(palette_response), drop = FALSE, ...)
}
scale_colour_response <- function(...) {
  ggplot2::scale_colour_manual(values = palette_response, breaks = names(palette_response), drop = FALSE, ...)
}

# =============================================================================
# 6) DIMENSION PALETTE  — Service / Information / Data (3D IRT plots)
# =============================================================================
#   Service = teal  |  Information = mauve  |  Data = sand

palette_dimension <- c(
  Service     = unname(palette_thesis["teal"]),
  Information = unname(palette_thesis["mauve"]),
  Data        = unname(palette_thesis["sand"])
)

scale_colour_dimension <- function(...) {
  ggplot2::scale_colour_manual(values = palette_dimension, breaks = names(palette_dimension), ...)
}
scale_fill_dimension <- function(...) {
  ggplot2::scale_fill_manual(values = palette_dimension, breaks = names(palette_dimension), ...)
}

# =============================================================================
# 7) THRESHOLD PALETTE  — b1 / b2 / b3 (Wright Map + difficulty plots)
# =============================================================================
#   b1 (1->2) = rose  |  b2 (2->3) = teal  |  b3 (3->4) = sage

palette_threshold <- c(
  "b1 (1\u21922)" = unname(palette_thesis["rose"]),
  "b2 (2\u21923)" = unname(palette_thesis["teal"]),
  "b3 (3\u21924)" = unname(palette_thesis["sage"])
)

scale_colour_threshold <- function(...) {
  ggplot2::scale_colour_manual(values = palette_threshold, breaks = names(palette_threshold), ...)
}
scale_fill_threshold <- function(...) {
  ggplot2::scale_fill_manual(values = palette_threshold, breaks = names(palette_threshold), ...)
}