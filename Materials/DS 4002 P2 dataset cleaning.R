# Load packages 
library(nflfastR)
library(tidyverse)

# Load play-by-play data
seasons <- 2010:2024
pbp <- load_pbp(seasons)

# Quick check
dim(pbp)

# create a new cleaned dataset 
pbp_clean <- pbp %>%
  select(
    season,
    week,
    game_id,
    play_type,
    home_score,
    away_score
  )

# drop missing values
pbp_clean <- pbp_clean %>%
  drop_na(season, week, game_id)

# write csv 
write_csv(pbp_clean, "pbp_clean.csv")
