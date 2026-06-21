# UTHM Campus Transport & Shuttle Management System 🚌📍

[![Enterprise Architecture](https://img.shields.io/badge/Enterprise--Architecture-TOGAF%20ADM-blue.svg)](#)
[![Figma Design](https://img.shields.io/badge/Design-Figma-orange.svg)](#)
[![Presentation Video](https://img.shields.io/badge/Presentation-Video-brightgreen.svg)](https://youtu.be/GTU8LRXz9Lw)

Welcome to the **UTHM Campus Transport & Shuttle Management System** repository. This project details the digital transformation and enterprise architecture planning designed to modernize and integrate the campus transit systems at **Universiti Tun Hussein Onn Malaysia (UTHM)**.

---

## 📂 Repository Structure

```
Enterprise/
├── system-documentation/
│   ├── ESDM_Project_Report_-_Group_5.pdf       # UTHM Enterprise Architecture & Systems Report
│   └── EA_-_Campus_Transport_and_Shuttle_Management.drawio.xml  # Draw.io Enterprise Architecture source diagram
├── images/                                     # System architecture diagrams and Figma UI screenshots
│   ├── enterprise_architecture_layers.png
│   ├── campus_transport_architecture.png
│   ├── system_architecture_diagram.png
│   ├── use_case_diagram.png
│   ├── entity_relationship_diagram.png
│   ├── ui_route_schedule_display.png
│   ├── ui_live_shuttle_tracking.png
│   ├── ui_eta_predictor_view.png
│   ├── ui_shuttle_occupancy_list.png
│   ├── ui_shuttle_occupancy_details.png
│   ├── ui_digital_ematric_checkin.png
│   ├── ui_checkin_confirmation.png
│   ├── ui_feedback_complaint_reporting.png
│   └── ui_transport_analytics_dashboard.png
└── README.md                                   # Project guide and visual showcase (This file)
```

---

## 📖 Project Overview

UTHM hosts approximately 18,000 students and staff across its campuses. Traditionally, transit operations (shuttle routes, bus timetables, GPS tracking, and feedback collection) were manual, paper-based, or worked on standalone systems in operational silos. This resulted in data redundancies, scheduling discrepancies, and long student wait times.

This project delivers an **integrated, enterprise-level digital transit solution** designed using Enterprise Architecture (EA) principles. By linking UTHM's legacy student master databases with live telemetry, the system enables real-time booking, vehicle tracking, and data-driven fleet optimization.

### Key Objectives
* **Eliminate Data Silos**: Merge transit data structures directly with UTHM's central Student Information System (SMP) and Staff Information System (SMS).
* **Real-time Access**: Provide students with live GPS tracking, capacity metrics, and Estimated Time of Arrival (ETA) predictions.
* **Administrative Analytics**: Empower UTHM administrators with usage dashboards tracking bus performance, peak hours, and feedback logs.

---

## 👥 Project Team & Course Details

Developed under the guidance of **Assoc Prof Dr Noorminshah A.Iahad** for the **Digital Transformation & Enterprise Systems** course.

### Group 5 Members (Team Tech EcoPioneer)
* **Muhammad Adam bin Razali** (`A23CS0116`)
* **Mohamed Alif Fathi bin Abdul Latif** (`A23CS0112`)
* **Ahmad Adib Zikri bin A.Mazlam** (`A23CS0205`)
* **Pravinraj A/L Sivabathi** (`A23CS0171`)
* **Dheshieghan A/L Saravana Moorthy** (`A23CS0072`)
* **Damiya Aina binti Basir Abd Shammad** (`A23CS0222`)

### 🎬 Presentation & Design Links
* **Presentation Video**: [Watch on YouTube](https://youtu.be/GTU8LRXz9Lw)
* **Figma Design File**: [View Figma Design](https://www.figma.com/design/i0FbD4WDwbJoNOPb6bVvUz/GROUP-5---Campus-Transport---Shuttle-Management?node-id=1-8483&t=5LExRMrQHDceOPpm-1)
* **Figma Interactive Prototype**: [Run Figma Prototype](https://www.figma.com/proto/i0FbD4WDwbJoNOPb6bVvUz/GROUP-5---Campus-Transport---Shuttle-Management?node-id=1-8483&t=vJT5DB1KkxNqJaWS-1)

---

## 📊 Enterprise & System Architecture

The blueprint of the platform is defined by multiple architectural viewpoints, resolving data silos and establishing security boundaries.

### 1. UTHM Enterprise Architecture Layers
Maps the integration flow from UTHM Stakeholders, down through Business Processes, software Applications, Data objects, and underlying Hosting Infrastructure.

![Enterprise Architecture Layers](images/enterprise_architecture_layers.png)

### 2. Sub-system Transit Architecture
Deconstructs the Campus Transport sub-system, illustrating the dependencies between route schedulers, GPS telemetry databases, and client dashboards.

![Campus Transport Architecture](images/campus_transport_architecture.png)

### 3. System Architecture Diagram
Defines the client app integration layers, UTHM Single Sign-On (SSO) gateway, and the central API layer communicating with the cloud data warehouses.

![System Architecture Diagram](images/system_architecture_diagram.png)

### 4. Use Case & Database ERD Model
Draws the relationship profiles between drivers, vehicles, student metrics, feedback tickets, and administrative logs.

| Use Case Diagram | Entity Relationship Diagram (ERD) |
|:---:|:---:|
| ![Use Case Diagram](images/use_case_diagram.png) | ![Entity Relationship Diagram](images/entity_relationship_diagram.png) |

---

## 📱 Figma UI/UX Mockups Showcase

Below is a visual showcase of the student mobile application and administrative web portals designed in Figma:

### 1. Shuttle Tracking & Route Planners
Allows students to view active bus routes and schedules (Buses A, B, C, D) and track real-time locations on the map.
* **Route List**: Lists available buses and their routes.
* **Live Tracker**: Pins active vehicle icons and shows stop-by-stop details.

| Route & Schedule List | Live Shuttle Tracking |
|:---:|:---:|
| ![Route Display Mockup](images/ui_route_schedule_display.png) | ![Live Shuttle Tracking Mockup](images/ui_live_shuttle_tracking.png) |

### 2. ETA & Shuttle Occupancy Details
* **ETA Predictor**: Provides a bottom pop-up containing exact countdown estimates for bus arrivals and walking distances.
* **Occupancy Monitoring**: Identifies crowding levels using color codes (Low / Medium / High) and displays live passenger counts.

| Estimated Arrival Time (ETA) | Occupancy List Overview | Occupancy Room Details |
|:---:|:---:|:---:|
| ![ETA Predictor Mockup](images/ui_eta_predictor_view.png) | ![Occupancy List Mockup](images/ui_shuttle_occupancy_list.png) | ![Occupancy Details Mockup](images/ui_shuttle_occupancy_details.png) |

### 3. Digital Check-In & Feedback
* **Digital E-Matric Card**: Allows students to check into the bus using simulated QR scan codes, which automatically updates the live vehicle passenger counts.
* **Feedback Form**: Lets students file complaints or suggestions categorizing issues directly.

| E-Matric Check-In | Check-In Successful | User Feedback Form |
|:---:|:---:|:---:|
| ![Digital E-Matric Mockup](images/ui_digital_ematric_checkin.png) | ![Checkin Confirmation Mockup](images/ui_checkin_confirmation.png) | ![Feedback Form Mockup](images/ui_feedback_complaint_reporting.png) |

### 4. Administration Analytics Dashboard
Provides UTHM administrative teams with real-time analytics including average occupancy rates, operational speeds, active shuttle summaries, passenger traffic trends, and categorized complaint breakdown charts.

![Transport Analytics Dashboard](images/ui_transport_analytics_dashboard.png)
