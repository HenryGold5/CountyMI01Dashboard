# District 1 Dashboards

Interactive dashboards for Michigan District 01 analysis.

## Project Structure

This project contains two components:

1. **Static Website** (`index.qmd`) - A landing page that can be deployed to GitHub Pages
2. **Shiny Dashboard** (`CountyOutputDashboard.qmd`) - An interactive Shiny app for county analysis

## Features

- 📊 Interactive Shiny dashboard with county-level data
- 🗺️ County-level analysis with maps and visualizations
- 📈 Demographics, voting patterns, and economic indicators
- 🚀 Static website deployment via GitHub Actions

## Running Locally

### Static Website
```bash
quarto render
# Output will be in _site/
```

### Shiny Dashboard
```bash
# Run the interactive dashboard locally
quarto serve CountyOutputDashboard.qmd
```

## Deployment

### Static Website
The static website (landing page) can be deployed to GitHub Pages via GitHub Actions.

### Shiny Dashboard
The Shiny dashboard requires a server to run and cannot be deployed as static content. Options:
- **shinyapps.io**: Deploy to Posit's cloud service
- **Shiny Server**: Self-hosted server
- **Posit Connect**: Enterprise deployment

To deploy to shinyapps.io:
```r
library(rsconnect)
rsconnect::deployApp(appFiles = "CountyOutputDashboard.qmd")
```

## Live Site

Once deployed, the static landing page will be available at:
`https://<your-username>.github.io/<repository-name>/` 
