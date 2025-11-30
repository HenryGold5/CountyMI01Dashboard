# Shiny app entry point for CountyOutputDashboard.qmd
# This file is required for deployment to shinyapps.io

library(quarto)

# Render and run the Quarto Shiny document
quarto::quarto_run("CountyOutputDashboard.qmd")
