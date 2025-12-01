# Load necessary libraries
library(sf)
library(rmapshaper)
library(readr)

cat("========================================\n")
cat("Data Optimization Script\n")
cat("========================================\n\n")

# 1. Convert all Shapefiles/GPKG to RDS (R Data Structure)
cat("Step 1: Converting spatial files to RDS...\n")


cat("  - Processing presincts... ")
presincts <- sf::st_read("data/Shapefiles/District1PresinctsWithVoting/district1Presincts.gpkg", quiet = TRUE)
presincts_lite <- rmapshaper::ms_simplify(presincts, keep = 0.05, keep_shapes = TRUE)
saveRDS(presincts_lite, "data/Shapefiles/district1Presincts_lite.rds", compress = "xz")
cat("Done! (", format(object.size(presincts_lite), units = "Kb"), ")\n", sep = "")

cat("  - Processing overall district... ")
overall <- sf::read_sf("data/Shapefiles/District1Overall/district1Overall.shp")
overall_lite <- rmapshaper::ms_simplify(overall, keep = 0.05, keep_shapes = TRUE)
saveRDS(overall_lite, "data/Shapefiles/district1Overall_lite.rds", compress = "xz")
cat("Done! (", format(object.size(overall_lite), units = "Kb"), ")\n", sep = "")

cat("  - Processing metro areas... ")
metro <- sf::read_sf("data/Shapefiles/District1Metro/district1Metro.shp")
metro_lite <- rmapshaper::ms_simplify(metro, keep = 0.05, keep_shapes = TRUE)
saveRDS(metro_lite, "data/Shapefiles/district1Metro_lite.rds", compress = "xz")
cat("Done! (", format(object.size(metro_lite), units = "Kb"), ")\n", sep = "")

cat("  - Processing counties... ")
counties_all <- sf::read_sf("data/Shapefiles/District1Counties/district1Counties.shp")
counties_all_lite <- rmapshaper::ms_simplify(counties_all, keep = 0.05, keep_shapes = TRUE)
saveRDS(counties_all_lite, "data/Shapefiles/district1Counties_lite.rds", compress = "xz")
cat("Done! (", format(object.size(counties_all_lite), units = "Kb"), ")\n", sep = "")

cat("  - Processing education data... ")
education_all <- sf::read_sf("data/Shapefiles/Education/educationDataset.shp")
education_all_lite <- rmapshaper::ms_simplify(education_all, keep = 0.05, keep_shapes = TRUE)
saveRDS(education_all_lite, "data/Shapefiles/educationDataset_lite.rds", compress = "xz")
cat("Done! (", format(object.size(education_all_lite), units = "Kb"), ")\n", sep = "")

# 2. Convert ALL Excel/CSV files to RDS for much faster loading
cat("\nStep 2: Converting Excel/CSV files to RDS...\n")

cat("  - votingResultsCountyWide... ")
countyVotingResults_all <- readxl::read_xlsx("data/ExcelFiles/votingResultsCountyWide.xlsx")
saveRDS(countyVotingResults_all, "data/ExcelFiles/votingResultsCountyWide.rds", compress = "xz")
cat("Done!\n")

cat("  - voterTurnout2024... ")
voterTurnout_all <- read.csv("data/ExcelFiles/voterTurnout2024.csv")
saveRDS(voterTurnout_all, "data/ExcelFiles/voterTurnout2024.rds", compress = "xz")
cat("Done!\n")

cat("  - spendDataVA... ")
vaSpend_all <- readxl::read_xlsx("data/ExcelFiles/spendDataVA.xlsx")
saveRDS(vaSpend_all, "data/ExcelFiles/spendDataVA.rds", compress = "xz")
cat("Done!\n")

cat("  - numEmployeesCounty... ")
numEmployees_all <- readxl::read_xlsx("data/ExcelFiles/numEmployeesCounty.xlsx")
saveRDS(numEmployees_all, "data/ExcelFiles/numEmployeesCounty.rds", compress = "xz")
cat("Done!\n")

cat("  - numEstablishmentsCounty... ")
numEstablishments_all <- readxl::read_xlsx("data/ExcelFiles/numEstablishmentsCounty.xlsx")
saveRDS(numEstablishments_all, "data/ExcelFiles/numEstablishmentsCounty.rds", compress = "xz")
cat("Done!\n")

cat("  - payRollCounty... ")
payRoll_all <- readxl::read_xlsx("data/ExcelFiles/payRollCounty.xlsx")
saveRDS(payRoll_all, "data/ExcelFiles/payRollCounty.rds", compress = "xz")
cat("Done!\n")

# CountyDemographics has multiple sheets - convert each one
cat("\nStep 3: Converting CountyDemographics sheets...\n")

cat("  - Sheet 1 (ageSex)... ")
ageSex_all <- readxl::read_xlsx("data/ExcelFiles/CountyDemographics.xlsx", sheet = 1)
saveRDS(ageSex_all, "data/ExcelFiles/CountyDemographics_ageSex.rds", compress = "xz")
cat("Done!\n")

cat("  - Sheet 2 (bachelorType)... ")
bachelorType_all <- readxl::read_xlsx("data/ExcelFiles/CountyDemographics.xlsx", sheet = 2)
saveRDS(bachelorType_all, "data/ExcelFiles/CountyDemographics_bachelorType.rds", compress = "xz")
cat("Done!\n")

cat("  - Sheet 3 (educationAttainment)... ")
educationAttainment_all <- readxl::read_xlsx("data/ExcelFiles/CountyDemographics.xlsx", sheet = 3)
saveRDS(educationAttainment_all, "data/ExcelFiles/CountyDemographics_educationAttainment.rds", compress = "xz")
cat("Done!\n")

cat("  - Sheet 4 (householdIncome)... ")
householdIncome_all <- readxl::read_xlsx("data/ExcelFiles/CountyDemographics.xlsx", sheet = 4)
saveRDS(householdIncome_all, "data/ExcelFiles/CountyDemographics_householdIncome.rds", compress = "xz")
cat("Done!\n")

cat("  - Sheet 5 (medianIncome)... ")
medianIncome_all <- readxl::read_xlsx("data/ExcelFiles/CountyDemographics.xlsx", sheet = 5)
saveRDS(medianIncome_all, "data/ExcelFiles/CountyDemographics_medianIncome.rds", compress = "xz")
cat("Done!\n")

cat("  - Sheet 6 (hispanicLatino)... ")
hispanicLatino_all <- readxl::read_xlsx("data/ExcelFiles/CountyDemographics.xlsx", sheet = 6)
saveRDS(hispanicLatino_all, "data/ExcelFiles/CountyDemographics_hispanicLatino.rds", compress = "xz")
cat("Done!\n")

cat("  - Sheet 7 (race)... ")
race_all <- readxl::read_xlsx("data/ExcelFiles/CountyDemographics.xlsx", sheet = 7)
saveRDS(race_all, "data/ExcelFiles/CountyDemographics_race.rds", compress = "xz")
cat("Done!\n")

cat("\n========================================\n")
cat("Optimization Complete!\n")
cat("All files converted to compressed RDS format.\n")
cat("========================================\n")
