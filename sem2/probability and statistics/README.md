# Probability & Statistical Data Analysis
## SECI 1143 - Probability & Statistical Data Analysis (UTM)

This repository contains academic projects and statistical studies exploring data exploration, hypothesis testing, correlation/regression modeling, and dependency tests.

---

## 📂 Repository Structure
```text
├───project-1
│       Project_1_Report_Gadget_Use.pdf     # Study on gadget use impact on learning
│
└───project-2
        Heart_Dataset.csv                   # Coronary Heart Disease (CHD) dataset
        Heart_Disease_Analysis.R            # R Script executing hypothesis, correlation & chi-square tests
        Project_2_Report_Heart_Disease.pdf  # Comprehensive R-based statistical report
```

---

## 📱 Project 1: Gadget Use & Its Impact on Learning Outcomes

An empirical survey-based research study exploring how undergraduates at the Faculty of Computing, Universiti Teknologi Malaysia (UTM) utilize digital tools for their studies.

### Methodology & Insights:
- **Data Collection**: Gathered 67 survey responses from undergraduates using Google Forms.
- **Demographics**: Respondent age ranges from 17 to 24 (Mean: 20.41, Mode/Median: 20).
- **Core Findings**:
  - **92.54%** of respondents find digital gadgets more convenient than traditional pen-and-paper for learning.
  - **Laptops** are the most common primary study device (35.8%), followed closely by tablets (32.8%) and smartphones (31.3%).
  - **Windows** is the most preferred operating system for educational activities.
  - R programming was utilized to clean data, establish frequency distributions, and generate bar and pie charts.

---

## 💔 Project 2: Coronary Heart Disease (CHD) Statistical Study

A rigorous statistical analysis performed on a clinical heart disease dataset to investigate correlations between patient demographics, heart rates, blood pressure, and target diagnoses.

### Key Analysis & R Implementation:
The analysis script (`Heart_Disease_Analysis.R`) implements four core statistical paradigms:

1. **Two-Sample Hypothesis Testing (T-Test)**:
   - *Objective*: Check if the mean maximum heart rate is significantly higher in patients with heart disease than in patients without.
   - *Method*: Independent two-sample t-test ($n_1=165$, $n_2=138$).
2. **Correlation Analysis**:
   - *Objective*: Investigate if age correlates linearly with resting blood pressure.
   - *Method*: Pearson’s correlation coefficient ($r$) significance testing.
3. **Simple Linear Regression**:
   - *Objective*: Model maximum heart rate as a linear function of age.
   - *Method*: Least-squares regression, calculating $R^2$, sum of squared errors, and testing slope significance.
4. **Chi-Square Test of Independence**:
   - *Objective*: Determine if the presence of Coronary Heart Disease is independent of a patient's biological sex.
   - *Method*: Chi-square test on contingency tables.

---

## 👥 Authors
- **Dheshieghan A/L Moorthy** (Matric ID: A23CS0072)
- **Pravinraj A/L Sivabathi** (Matric ID: A23CS0171)
- **Harresh A/L Uthayakumar** (Matric ID: A23CS0226)
- **Ghadeer Mahmoud** (Matric ID: T23CS4008)

**Lecturer**: Dr. Nor Haizan Bt Mohamed Radzi (Section 03)


---

## 💭 Course Reflection
Applying statistical algorithms, distributions, and probability models to datasets here taught me how to find trends in noise. This is the bedrock of data analytics and feature engineering for machine learning pipelines.
