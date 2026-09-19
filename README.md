# ✈️ Flight Delay & Airline Operations Analytics

## 📌 Project Overview

This project analyzes **5.8M+ U.S. domestic flight records** to
understand airline delays, airport performance, route-level operational
risk, time-based delay patterns, and recovery after delayed departures.

The project uses **Python** for large-scale exploratory data analysis
and feature engineering, with supporting **SQL analysis** and a
structure designed for operational reporting and dashboarding.

> **Note:** Final numerical findings should be refreshed from the latest
> corrected full-dataset notebook run before being treated as final
> project results.

------------------------------------------------------------------------

## 🎯 Problem Statement

Flight delays and cancellations affect airline operations, airport
efficiency, passenger experience, and network reliability.

The objective of this project is to analyze historical flight operations
data and identify:

-   Airlines with elevated delay rates
-   High-volume airports experiencing operational delays
-   Routes with higher combined delay and cancellation risk
-   Months and departure hours associated with higher delay rates
-   Airlines that recover time after delayed departures
-   Operational patterns useful for performance monitoring

------------------------------------------------------------------------

## 📊 Dataset

The project uses the **2015 U.S. Flight Delays and Cancellations**
dataset based on U.S. Department of Transportation / Bureau of
Transportation Statistics flight data.

### Dataset Scale

-   **5.8M+ flight records**
-   **31 variables**
-   U.S. domestic flight operations
-   Airline, airport, route, schedule, delay, cancellation, and
    elapsed-time information

Because the raw flight dataset is very large, it is **not stored
directly in this repository**. Dataset access instructions can be
provided in the `data/README.md` file.

------------------------------------------------------------------------

## 🔄 Project Workflow

Data Loading\
↓\
Data Quality Checks\
↓\
Data Cleaning\
↓\
Feature Engineering\
↓\
Eligible-Flight Definition\
↓\
Airline Analysis\
↓\
Airport Analysis\
↓\
Route Analysis\
↓\
Time-Based Delay Analysis\
↓\
Recovery Analysis\
↓\
Operational Insights

------------------------------------------------------------------------

## 🧹 Data Preparation & Feature Engineering

The raw flight data was prepared for analysis by creating and validating
operational features such as:

-   Route identifiers
-   Departure time features
-   Delay status
-   Cancellation status
-   Eligible completed-flight indicator
-   Delay and recovery measures
-   Route-level operational metrics

Delay-rate calculations use eligible completed flights as the
denominator so that the analysis consistently compares relevant flight
operations.

------------------------------------------------------------------------

## ✈️ Airline Performance Analysis

Airline-level analysis evaluates operational performance using metrics
such as:

-   Flight volume
-   Departure delays
-   Delay rate
-   Average departure delay
-   Cancellation behavior
-   Recovery after delayed departures

This helps identify differences in operational performance across
carriers.

------------------------------------------------------------------------

## 🛫 Airport Analysis

Origin airports are analyzed to understand:

-   Traffic volume
-   Average departure delay
-   Delay frequency
-   High-volume airport performance

Volume thresholds are used where appropriate so that comparisons focus
on operationally meaningful airports rather than very small samples.

------------------------------------------------------------------------

## 🗺️ Route-Level Analysis

Routes are created by combining origin and destination airports.

The analysis compares routes using:

-   Flight volume
-   Delay rate
-   Cancellation rate
-   Average delay
-   Operational-risk score

### Project-Defined Route Risk Score

A project-specific heuristic is used to combine delay and cancellation
performance:

    Route Risk Score = 0.70 × Delay Rate + 0.30 × Cancellation Rate

This score is a **project-defined analytical index**, not an
industry-standard aviation metric.

------------------------------------------------------------------------

## ⏰ Time-Based Delay Analysis

Flight performance is segmented across:

-   Month
-   Departure hour
-   Other relevant time periods

This helps identify periods associated with elevated delay rates and
supports analysis of temporal operational patterns.

------------------------------------------------------------------------

## 🔁 Delay Recovery Analysis

The project also examines whether airlines recover time after departing
late.

Recovery analysis compares departure delay with downstream flight timing
to identify carriers that reduce part of the initial delay during the
remainder of the journey.

------------------------------------------------------------------------

## 💡 Analysis Outputs

The full analysis generates insights covering:

-   Airline delay performance
-   Airport-level delays
-   Route-level operational risk
-   Monthly delay patterns
-   Hourly delay patterns
-   Airline recovery performance

Final figures should be taken directly from the latest executed
corrected notebook.

------------------------------------------------------------------------

## 🛠️ Tech Stack

-   **Programming:** Python
-   **Data Processing:** Pandas, NumPy
-   **Analysis:** Exploratory Data Analysis (EDA)
-   **Database / Querying:** SQL / PostgreSQL
-   **Visualization:** Matplotlib
-   **Dashboarding:** Power BI
-   **Environment:** Jupyter Notebook / Google Colab

------------------------------------------------------------------------

## 📁 Project Structure

    flight-delay-airline-operations-analytics/
    │
    ├── Flight_Delay_Airline_Operations_EDA.ipynb
    ├── README.md
    ├── requirements.txt
    │
    ├── data/
    │   └── README.md
    │
    ├── outputs/
    │   └── portfolio_insights.txt
    │
    ├── sql/
    │   └── analysis_queries.sql
    │
    └── powerbi/
        └── dashboard_guide.md

------------------------------------------------------------------------

## ⚙️ Installation & Usage

Clone the repository:

    git clone https://github.com/Aditya01110/flight-delay-airline-operations-analytics.git

Move into the project directory:

    cd flight-delay-airline-operations-analytics

Install the required libraries:

    pip install -r requirements.txt

Download the dataset according to the instructions in:

    data/README.md

Open:

    Flight_Delay_Airline_Operations_EDA.ipynb

For final portfolio results, run the notebook on the **full dataset**
rather than a sample.

------------------------------------------------------------------------

## 📦 Requirements

Core Python packages include:

    pandas
    numpy
    matplotlib

Additional dependencies should match the imports used in the final
notebook.

------------------------------------------------------------------------

## 📌 Methodology Note

For consistent delay-rate analysis, the corrected workflow distinguishes
between all scheduled flights and flights eligible for completed-flight
delay calculations.

This prevents cancelled or otherwise ineligible flights from incorrectly
affecting the denominator of completed-flight delay rates.

The route-risk score is used only as a project-specific ranking
heuristic for exploratory operational analysis.

------------------------------------------------------------------------

## 🚀 Future Improvements

-   Build an interactive Power BI operations dashboard
-   Add additional SQL-based KPI analysis
-   Analyze weather-related delay drivers
-   Add airport and route seasonality analysis
-   Explore predictive modeling for flight-delay risk
-   Compare performance across multiple years
-   Add geospatial route and airport visualizations

------------------------------------------------------------------------

## 👤 Author

**Aditya Kumar Rawani**\
B.Tech, Indian Institute of Technology Guwahati
