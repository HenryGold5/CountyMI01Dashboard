# Load necessary libraries
library(sf)
library(rmapshaper)
library(readr) # Or library(qs) for even faster reading (requires qs package)

# 1. Convert all Shapefiles/GPKG to RDS (R Data Structure)


presincts <- sf::st_read("data/Shapefiles/District1PresinctsWithVoting/district1Presincts.gpkg")
presincts_lite <- rmapshaper::ms_simplify(presincts, keep = 0.05, keep_shapes = TRUE)
saveRDS(presincts_lite, "data/Shapefiles/district1Presincts_lite.rds")

overall <- sf::read_sf("data/Shapefiles/District1Overall/district1Overall.shp")
overall_lite <- rmapshaper::ms_simplify(overall, keep = 0.05, keep_shapes = TRUE)
saveRDS(overall_lite, "data/Shapefiles/district1Overall_lite.rds")

metro <- sf::read_sf("data/Shapefiles/District1Metro/district1Metro.shp")
metro_lite <- rmapshaper::ms_simplify(metro, keep = 0.05, keep_shapes = TRUE)
saveRDS(metro_lite, "data/Shapefiles/district1Metro_lite.rds")

counties_all <- sf::read_sf("data/Shapefiles/District1Counties/district1Counties.shp")
counties_all_lite <- rmapshaper::ms_simplify(counties_all, keep = 0.05, keep_shapes = TRUE)
saveRDS(counties_all_lite, "data/Shapefiles/district1Counties_lite.rds")

education_all <- sf::read_sf("data/Shapefiles/Education/educationDataset.shp")
education_all_lite <- rmapshaper::ms_simplify(education_all, keep = 0.05, keep_shapes = TRUE)
saveRDS(education_all_lite, "data/Shapefiles/educationDataset_lite.rds")

# 2. Check and Optimize CSV/Excel files (Optional but recommended)
# Convert them to RDS as well to speed up reading
countyVotingResults_all <- readxl::read_xlsx("data/ExcelFiles/votingResultsCountyWide.xlsx")
saveRDS(countyVotingResults_all, "data/ExcelFiles/votingResultsCountyWide.rds")

voterTurnout_all <- read.csv("data/ExcelFiles/voterTurnout2024.csv")
saveRDS(voterTurnout_all, "data/ExcelFiles/voterTurnout2024.rds")
