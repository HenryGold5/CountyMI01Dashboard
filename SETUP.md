# District 1 Dashboards - Setup Guide

This guide will help you deploy your password-protected dashboard website using GitHub Pages.

## Overview

The website includes:
- **Homepage** (`index.qmd`): Landing page with links to all dashboards
- **County Dashboard** (`CountyOutputDashboard.qmd`): District 1 county analysis
- **Password Protection**: Using the `shinymanager` R package
- **GitHub Actions**: Automated deployment to GitHub Pages

## Prerequisites

1. R (version 4.3 or higher)
2. Quarto (latest version)
3. GitHub account with Pages enabled

## Required R Packages

The following R packages are required and will be installed automatically by GitHub Actions:

```r
install.packages(c(
  "dplyr", "tmap", "sf", "cartogram", "gt", "gtExtras",
  "stringr", "ggplot2", "scales", "shiny", "shinymanager",
  "bslib", "tidyr", "readxl"
))
```

## Changing the Default Password

**IMPORTANT**: Change the default password before deploying!

The default credentials are:
- Username: `admin`
- Password: `district1`

To change the password:

1. Edit `index.qmd` (line ~26)
2. Edit `CountyOutputDashboard.qmd` (line ~36-41)

Update this section:
```r
credentials <- data.frame(
  user = c("admin"),
  password = c("YOUR_NEW_PASSWORD_HERE"),
  admin = c(TRUE),
  stringsAsFactors = FALSE
)
```

### Adding Multiple Users

You can add multiple users by extending the credentials data frame:

```r
credentials <- data.frame(
  user = c("admin", "user1", "user2"),
  password = c("password1", "password2", "password3"),
  admin = c(TRUE, FALSE, FALSE),
  stringsAsFactors = FALSE
)
```

## Deploying to GitHub Pages

### Step 1: Enable GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings** → **Pages**
3. Under "Source", select **GitHub Actions**

### Step 2: Push Your Changes

```bash
git add .
git commit -m "Set up password-protected dashboards website"
git push origin main
```

### Step 3: Wait for Deployment

1. Go to the **Actions** tab in your repository
2. Wait for the "Deploy Quarto Site to GitHub Pages" workflow to complete
3. Your site will be available at: `https://<username>.github.io/<repository>/`

## Local Development

To preview the site locally:

```bash
quarto preview
```

This will start a local server and open the site in your browser.

## Project Structure

```
CountyMI01Dashboard/
├── .github/
│   └── workflows/
│       └── publish.yml          # GitHub Actions workflow
├── data/                        # Data files
├── _quarto.yml                  # Quarto project configuration
├── index.qmd                    # Homepage
├── CountyOutputDashboard.qmd    # County dashboard
├── styles.css                   # Custom CSS
└── .gitignore                   # Git ignore rules
```

## Adding New Dashboards

1. Create a new `.qmd` file (e.g., `NewDashboard.qmd`)
2. Add password protection using the same credentials setup
3. Update `_quarto.yml` to add the new page to the navbar
4. Update `index.qmd` to add a card linking to the new dashboard

## Troubleshooting

### GitHub Actions Fails

- Check the Actions tab for error messages
- Ensure all R packages are listed in the workflow
- Verify that your data files are committed to the repository

### Password Protection Not Working

- Ensure `shinymanager` is installed
- Check that credentials are defined in both `index.qmd` and dashboard files
- Verify the `server-ui-wrapper` is correctly set in dashboard YAML headers

### Local Preview Doesn't Work

- Install all required R packages locally
- Run `quarto check` to verify Quarto installation
- Ensure data files are in the correct locations

## Security Notes

1. **Never commit passwords in plain text** - Consider using environment variables for production
2. The current implementation is suitable for basic access control
3. For production use, consider more robust authentication methods
4. GitHub Pages sites are public by default - the password only protects the Shiny app content

## Support

For Quarto documentation: https://quarto.org/docs/
For shinymanager documentation: https://datastorm-open.github.io/shinymanager/
