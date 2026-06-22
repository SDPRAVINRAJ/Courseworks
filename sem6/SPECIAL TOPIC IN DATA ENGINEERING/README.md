# SPECIAL TOPIC IN DATA ENGINEERING (SECP3843)

## 📚 Course Information

- **Course:** Special Topic in Data Engineering (SECP3843)
- **Semester:** Semester 6
- **Programme:** Bachelor of Computer Science (Data Engineering)

---

# 🎯 Course Overview

Special Topic in Data Engineering focuses on modern data engineering concepts, data pipelines, data quality, data warehousing, cloud analytics, and business intelligence. The course emphasizes practical implementation through hands-on tutorials and industry-oriented projects that simulate real-world data engineering challenges.

---

# 📂 Coursework

## Tutorial 1

Completed practical exercises covering fundamental data engineering concepts and workflow design.

### Reflection
This tutorial provided a strong foundation for understanding how data flows through modern data platforms and introduced the responsibilities of a data engineer in managing data throughout its lifecycle.

---

## Tutorial 2

Completed practical exercises related to data quality assessment, profiling, and transformation.

### Reflection
I learned the importance of maintaining high-quality data and how proper data preparation improves the reliability of analytics and business decision-making.

---

## Tutorial 3

Completed practical exercises involving data warehousing and analytical data modeling.

### Reflection
This tutorial helped me understand how data warehouses support efficient reporting and analytics through structured data organization.

---

## Tutorial 4

Completed practical exercises involving business intelligence and dashboard development.

### Reflection
I gained valuable experience in transforming raw data into meaningful visual insights that support business monitoring and decision-making.

---

# 🏭 Main Project: PPG Inventory Analytics Pipeline

## Project Overview

The main project for this course was inspired by a real business challenge faced by **PPG Industries Malaysia**, a global manufacturer of paints, coatings, and specialty materials.

The project focused on addressing inventory management challenges by developing a modern data engineering solution capable of identifying inventory risks, stock obsolescence, and financial impact while supporting business decision-making through analytics and visualization.

---

## Business Problems Addressed

The proposed solution helps to:

- Identify excess inventory exceeding 12 months of projected consumption.
- Detect Recoverable Assets (RA).
- Detect Magna Carta (MC) Dead Stock and Expired Inventory.
- Calculate inventory provision amounts.
- Identify stockout risks based on lead times.
- Analyze customer orders affected by inventory shortages.

---

## Technologies Used

- Azure Data Factory (ADF)
- Azure Data Lake Storage Gen2 (ADLS Gen2)
- Azure Synapse Analytics
- SQL
- Power BI

---

## Data Architecture

The project implemented a Medallion Architecture consisting of:

### Bronze Layer
- Raw data ingestion.

### Silver Layer
- Data cleansing and transformation.

### Gold Layer
- Business-ready analytical datasets.

---

## Data Warehouse Design

A Galaxy Schema was developed to support analytical reporting and business intelligence requirements.

### Fact Tables
- Fact Sales
- Fact Production

### Dimension Tables
- Product
- Customer
- Material
- Date
- Inventory

---

## Dashboard Features

The Power BI dashboard provides insights into:

- Recoverable Assets (RA)
- Magna Carta (MC) Provision
- Dead Stock
- Expired Inventory
- Stockout Risks
- Customer Impact Analysis
- Inventory Performance Metrics

---

## Project Resources

### PPG Inventory Analytics Project

🔗 Google Drive Repository:

https://drive.google.com/drive/folders/13n1VgtXybZWpv8iQq86MlTMWJ0iHJm9W?usp=sharing

---

# 💡 Overall Reflection

Special Topic in Data Engineering has been one of the most practical and industry-focused courses throughout my degree. The tutorials strengthened my understanding of data engineering fundamentals, while the PPG Inventory Analytics project allowed me to apply those concepts in a realistic business environment.

Through this project, I experienced the complete data engineering lifecycle, from data ingestion and transformation to data warehousing and dashboard development. Working with Azure services and Power BI also improved my technical skills in cloud-based analytics platforms.

Most importantly, this course helped me understand how data engineering creates value for organizations by transforming raw operational data into actionable business insights. It reinforced my interest in pursuing a career in Data Engineering and provided hands-on experience that closely resembles real industry practices.

---

# 🛠️ Skills Developed

- Data Engineering Fundamentals
- ETL / ELT Development
- Azure Data Factory
- Azure Synapse Analytics
- Azure Data Lake Storage Gen2
- SQL Development
- Data Warehousing
- Dimensional Modeling
- Power BI Dashboard Development
- Data Quality Management
- Business Intelligence
- Cloud Analytics

---

# 📌 Conclusion

Special Topic in Data Engineering provided valuable exposure to modern data engineering technologies and industry practices. Through tutorials and the PPG Inventory Analytics Pipeline project, I gained practical experience in building data pipelines, designing analytical data warehouses, and developing business intelligence solutions. The knowledge and skills acquired from this course have strengthened my technical foundation and prepared me for future opportunities in Data Engineering and Analytics.
