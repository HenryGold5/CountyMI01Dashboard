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
The static website (landing page) is automatically deployed to GitHub Pages via GitHub Actions.

### Shiny Dashboard
The Shiny dashboard is automatically deployed to **Posit Connect Cloud** via GitHub Actions when changes are pushed to the main branch.

#### Manual Deployment to Posit Connect Cloud
To deploy manually:
```r
library(rsconnect)

# Configure Posit Connect Cloud
rsconnect::addConnectServer(
  url = "https://connect.posit.cloud/",
  name = "posit-connect-cloud"
)

rsconnect::connectApiUser(
  account = "henrygold5",
  server = "posit-connect-cloud",
  apiKey = "YOUR_API_KEY"
)

# Deploy the app
rsconnect::deployApp(
  appFiles = "CountyOutputDashboard.qmd",
  server = "posit-connect-cloud"
)
```

#### Required GitHub Secrets
For automated deployment, configure these secrets in your GitHub repository:
- `POSIT_CONNECT_URL`: Your Posit Connect Cloud URL (e.g., `https://connect.posit.cloud/`)
- `POSIT_CONNECT_API_KEY`: Your Posit Connect Cloud API key

## Live Site

Once deployed, the static landing page will be available at:
`https://<your-username>.github.io/<repository-name>/` 
