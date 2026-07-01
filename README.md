# 🚀 AI-Powered Customer Retention Intelligence Platform

> An end-to-end AI platform that predicts customer churn, calculates customer risk, generates retention recommendations, and provides business insights through an interactive Power BI dashboard.

---

# 📌 Project Overview

Customer churn is one of the biggest challenges faced by SaaS businesses. Losing existing customers directly impacts revenue, customer lifetime value, and long-term growth.

Traditional churn analysis only tells businesses **who is likely to leave**. Our platform goes a step further by answering:

- Who is likely to churn?
- What is their churn risk?
- What factors influence churn?
- Which customers should be prioritized?
- What actions should the business take?

The platform transforms raw customer data into actionable business intelligence using Machine Learning, Feature Engineering, and Business Analytics.

---

# 🎯 Problem Statement

Businesses invest significant resources in acquiring customers but often fail to identify early warning signs of churn.

Existing solutions generally:

- Detect churn too late
- Focus only on prediction
- Do not prioritize customers
- Lack actionable business recommendations
- Do not estimate customer health

As a result, organizations lose customers, revenue, and growth opportunities.

---

# 💡 Proposed Solution

This project builds an AI-powered Customer Retention Intelligence Platform that:

- Predicts customer churn
- Calculates customer risk scores
- Generates customer health scores
- Segments customers by risk
- Provides AI-powered retention recommendations
- Visualizes insights using Power BI dashboards

Instead of simply predicting churn, the platform helps businesses make proactive retention decisions.

---

# 👥 Target Users

### Primary Users

- Customer Success Teams
- Business Managers
- CRM Teams
- Marketing Teams
- Sales Teams

### Secondary Users

- Data Analysts
- Business Analysts
- Executives

---

# 🎯 Project Goals

The platform aims to:

- Reduce customer churn
- Improve customer retention
- Increase customer lifetime value
- Support business decision-making
- Prioritize high-risk customers
- Deliver actionable AI recommendations

---

# 📊 Success Metrics

The project is evaluated using both business and machine learning metrics.

### Business KPIs

- Customer Churn Rate
- Customer Retention Rate
- High-Risk Customer Count
- Customer Health Score
- Revenue at Risk

### Machine Learning Metrics

- Accuracy
- Precision
- Recall
- F1 Score
- ROC-AUC Score

---

# 🔄 Project Workflow

```text
Raw Customer Data
        │
        ▼
Data Cleaning
        │
        ▼
Customer360 Creation
        │
        ▼
Feature Engineering
        │
        ▼
Machine Learning Models
(Logistic Regression,
Random Forest,
XGBoost)
        │
        ▼
Model Comparison
        │
        ▼
Customer Risk Score
        │
        ▼
Recommendation Engine
        │
        ▼
Power BI Dashboard
```

---

# 🏗️ Project Architecture

```
Raw CSV Files
      │
      ▼
Customer360 Dataset
      │
      ▼
Feature Engineering
      │
      ▼
Machine Learning Pipeline
      │
      ▼
Risk Scoring Engine
      │
      ▼
Recommendation Engine
      │
      ▼
Business Dashboard
```

---

# 📁 Project Structure

```
RavenStack-Customer-Churn-Analysis

│
├── data
│   ├── raw
│   └── processed
│
├── notebooks
│   ├── 01_Customer360_Data_Preparation.ipynb
│   ├── 02_Feature_Engineering.ipynb
│   └── 03_AI_ML_Churn_Prediction.ipynb
│
├── powerbi
│
├── docs
│
├── sql
│
├── README.md
│
└── .gitignore
```

---

# 📂 Dataset

Dataset Used:

**RavenStack SaaS Customer Churn Dataset**

Tables:

- Accounts
- Subscriptions
- Feature Usage
- Support Tickets
- Churn Events

After data integration, a Customer360 dataset is created for machine learning.

---

# 🧠 Machine Learning Pipeline

The project follows a structured ML workflow.

### Data Preparation

- Missing Value Handling
- Data Cleaning
- Customer360 Dataset Creation
- Feature Aggregation

### Feature Engineering

Created Features:

- Customer Health Score
- Usage Score
- Support Score
- Subscription Stability
- Tenure Days
- Risk Category

### Machine Learning Models

- Logistic Regression
- Random Forest
- XGBoost

Models are evaluated using:

- Accuracy
- Precision
- Recall
- F1 Score
- ROC-AUC

The best-performing model is used to generate customer risk scores.

---

# ⚡ Core Features

## 1. Customer360 Dataset

Combines multiple SaaS datasets into a unified customer profile.

---

## 2. Feature Engineering

Creates business-centric features including:

- Customer Health Score
- Usage Score
- Support Score
- Subscription Stability
- Customer Tenure

---

## 3. Churn Prediction

Predicts customers likely to churn using Machine Learning.

---

## 4. Customer Risk Scoring

Generates a risk score (0–100) for every customer.

Risk Levels:

- Low
- Medium
- High
- Critical

---

## 5. AI Recommendation Engine

Generates retention strategies based on customer risk.

Examples:

| Risk Level | Recommendation |
|------------|----------------|
| Critical | Immediate account manager intervention |
| High | Personalized retention campaign |
| Medium | Feature adoption and onboarding |
| Low | Regular customer engagement |

---

## 6. Business Dashboard

Interactive Power BI dashboard providing:

- Customer Overview
- Churn Analysis
- Risk Distribution
- Customer Health
- Revenue Insights
- High-Risk Customers
- Retention Recommendations

---

# 🛠️ Tech Stack

### Programming

- Python

### Data Processing

- Pandas
- NumPy

### Machine Learning

- Scikit-Learn
- XGBoost

### Visualization

- Matplotlib
- Power BI

### Version Control

- Git
- GitHub

---

# 📈 Model Comparison

| Model | Accuracy | Precision | Recall | ROC-AUC |
|--------|---------:|----------:|-------:|---------:|
| Logistic Regression | 0.78 | 0.50 | 0.045 | 0.632 |
| Random Forest | 0.78 | 0.00 | 0.000 | 0.564 |
| XGBoost | 0.76 | 0.33 | 0.091 | 0.540 |

> Since the RavenStack dataset is synthetically generated, correlation analysis indicated weak relationships between the target variable and available features. The comparison is presented to demonstrate the complete machine learning workflow rather than to claim production-level predictive performance.

---

# ⭐ Unique Selling Points

Unlike traditional churn prediction systems, this platform answers:

✅ Who is likely to churn?

✅ What is the customer's risk level?

✅ How healthy is the customer relationship?

✅ Which customers should be prioritized?

✅ What retention action should be taken?

This transforms machine learning predictions into actionable business intelligence.

---

# 🚀 Future Enhancements

Future versions may include:

- Real-time churn prediction
- CRM Integration
- Automated Email Campaigns
- LLM-powered Customer Success Assistant
- API Deployment
- Live Customer Monitoring

---

# 📦 Deliverables

- Customer360 Dataset
- Feature Engineered Dataset
- Machine Learning Models
- Customer Risk Scoring Engine
- Recommendation Engine
- Power BI Dashboard
- Project Documentation
- GitHub Repository

---

# 👨‍💻 Authors

Developed as part of the **India Runs AI Challenge**.

---

# 📄 License

This project is developed for educational and competition purposes.
