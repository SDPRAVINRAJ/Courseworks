# 📦 Recoverable Assets (RA) & Inventory Risk Management (IRM)

## 📖 Project Overview

This project focuses on developing an end-to-end cloud-based data engineering and business intelligence solution for inventory risk management in a manufacturing environment. The system was designed to address common inventory challenges such as excess stock, obsolete materials, expired inventory, financial provisioning, and stockout risks that may affect customer order fulfillment.

The solution implements a Medallion Architecture (Bronze, Silver, and Gold layers) using Microsoft Azure services, including Azure Data Factory, Azure Data Lake Storage Gen2, and Azure Synapse Analytics. Six operational datasets were ingested, transformed, and integrated into an analytics-ready Galaxy Schema before being visualized through interactive Power BI dashboards.

The project automates the identification of Recoverable Assets (RA), Magna Carta (MC) Dead Stock, Expired Materials, financial exposure, and material shortages while providing business stakeholders with actionable insights for proactive inventory management and decision-making.

---

## 🏗️ Architecture

### Bronze Layer

* Raw ingestion of six operational datasets
* Data quality validation
* Schema and duplicate checking
* Preservation of original source data

### Silver Layer

* Business rule implementation
* Recoverable Assets (RA) identification
* Magna Carta (MC) Dead Stock detection
* Expired material analysis
* Stockout risk assessment
* Customer sales impact mapping

### Gold Layer

* Galaxy Schema data warehouse
* Fact and Dimension table generation
* Analytics-ready datasets
* Business Intelligence reporting layer

---

## 🛠️ Technologies Used

* Microsoft Azure Data Factory
* Azure Data Lake Storage Gen2
* Azure Synapse Analytics
* SQL
* Power BI
* Medallion Architecture
* Galaxy Schema Data Modelling

---

## 📊 Key Features

* Automated Recoverable Assets (RA) detection
* Dead stock and expired inventory monitoring
* Financial provisioning calculations
* Material stockout risk prediction
* Customer sales order impact analysis
* Interactive inventory risk dashboards
* End-to-end cloud-based ETL pipeline

---

## 🎯 Project Outcomes

* Improved inventory visibility across business operations
* Reduced dependency on manual inventory analysis
* Faster identification of inventory-related risks
* Better support for proactive decision-making
* Centralized inventory analytics platform
* Scalable cloud-based data engineering architecture

---

## 💭 Personal Reflection

This project provided me with valuable hands-on experience in designing and implementing a complete cloud-based data engineering solution. Throughout the development process, I gained a deeper understanding of how modern data pipelines are built using Azure services and how raw operational data can be transformed into meaningful business insights.

One of the most valuable lessons from this project was learning how data engineering extends beyond data movement. I learned the importance of understanding business requirements, translating business rules into technical logic, and designing data models that support effective decision-making. Working with Medallion Architecture, dimensional modelling, and Power BI dashboards strengthened both my technical and analytical skills.

Overall, this project enhanced my practical knowledge of cloud technologies, ETL development, data warehousing, and business intelligence while reinforcing the importance of building scalable and reliable data solutions that create real business value.
