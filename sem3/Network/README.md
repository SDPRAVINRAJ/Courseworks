# 🌐 Network Design for Faculty of Computing Block N28B
### SECR1213-12 Network Communications Group Project — Group 5 (CyberLinks)

Welcome to the **Network & Communications** repository. This project details the architectural planning, hardware device selection, physical cabling layout, and IP addressing schema for the new two-floor building of the **Faculty of Computing at Universiti Teknologi Malaysia (UTM)**.

---

## 📂 Repository Structure
```text
├───reports
│       Task_3_LAN_Devices.pdf             # Detailed LAN device selection & reflections
│       Task_4_Making_Connections.pdf      # Cabling specifications & physical layout design
│       Task_5_IP_Assignation.pdf          # IP addressing and subnetting tables
│       Task_6A_Full_Project_Report.pdf    # Comprehensive Group Project Full Report
│
└───simulations
        Project_Floor_Plan_Lvl_2.pkt       # Cisco Packet Tracer network simulation file
```

---

## 🏫 Project Overview
- **Objective**: Design a secure, high-performance, and scalable network infrastructure to support academic labs, classrooms, student lounges, administrative facilities, and anticipated **15% expansion** of students and staff over the next four years.
- **Academic Context**: SECR1213-12 (Network Communications)
- **Institution**: Universiti Teknologi Malaysia (UTM)
- **Supervising Lecturer**: Dr. Firoz Yusuf Patel Dawoodi
- **Group Members (CyberLinks)**:
  - Muhammad Afiq Danish bin Mohd Hazni (A23CS0118)
  - Muhammad Syahmi Faris bin Rusli (A23CS0138)
  - Muhammad Afiq Danial bin Rozaidie (A23CS0117)
  - Dheshieghan A/L Saravana Moorthy (A23CS0072)

### 💰 Budget & Cost Breakdown
- **Allocated Budget**: RM 5,000,000.00
- **Total Network Infrastructure Cost**: **RM 857,094.54**
- **Surplus Budget**: RM 4,142,905.46

---

## ⚙️ Hardware & Device Specifications

We selected premium, enterprise-grade hardware to future-proof the faculty building:

| Device Category | Model | key Specifications | Quantity |
| :--- | :--- | :--- | :---: |
| **Enterprise Router** | Cisco Catalyst C8200L 1N-4T | Intel x86 CPU, 4GB RAM, 8GB Flash, 4 WAN + 2 SFP + 2 RJ45 ports | 1 |
| **Workgroup Switch** | Cisco Catalyst C9200L-24P-4G-E | 24 Ports PoE+, 80 Gbps stacking, 2GB DRAM, 4GB Flash | 4 |
| **Wireless AP** | Ubiquiti U7 Pro Max | Wi-Fi 7 (802.11be), 15 Gbps throughput, PoE+, covers 160 m² | 9 |
| **Cable Modem** | Netgear Orbi RBSE960B | Quad-Band Wi-Fi 6E mesh system, 1GB RAM, 512MB Flash | 2 |
| **Lab Router** | Cisco 4451 ISR | Multi-core x86, 1-2 Gbps upgradable throughput, 8GB Flash | 2 |
| **Lab Switch** | Catalyst 9300X-M | Stackable 24/48 ports, 480 Gbps capacity, 16GB DRAM | 4 |
| **Workstations** | HP Pavilion Gaming TG01-2015D | AMD Ryzen 5 5600G, 8GB DDR4, 512GB SSD, NVIDIA RTX 3060 Ti | 130 |

---

## 🛜 IP Addressing & Subnetting Plan
The network addressing layout splits the assigned group base network **`192.168.0.0/8`** into dedicated **`/24` subnets** (`255.255.255.0`) to isolate broadcast domains and ensure security:

| Subnet | Work Area | Devices Count | Network Address | Usable IP Range | Broadcast Address |
| :---: | :--- | :---: | :---: | :--- | :---: |
| **1** | Hybrid Classroom | 4 | `192.168.1.0` | `192.168.1.1 - 192.168.1.254` | `192.168.1.255` |
| **2** | Cafe | 3 | `192.168.2.0` | `192.168.2.1 - 192.168.2.254` | `192.168.2.255` |
| **3** | Video Conferencing Room | 11 | `192.168.3.0` | `192.168.3.1 - 192.168.3.254` | `192.168.3.255` |
| **4** | Student Lounge | 4 | `192.168.4.0` | `192.168.4.1 - 192.168.4.254` | `192.168.4.255` |
| **5** | General Purpose Lab 1 | 39 | `192.168.5.0` | `192.168.5.1 - 192.168.5.254` | `192.168.5.255` |
| **6** | General Purpose Lab 2 | 39 | `192.168.6.0` | `192.168.6.1 - 192.168.6.254` | `192.168.6.255` |
| **7** | Cisco Network Lab | 45 | `192.168.7.0` | `192.168.7.1 - 192.168.7.254` | `192.168.7.255` |
| **8** | Embedded Lab | 38 | `192.168.8.0` | `192.168.8.1 - 192.168.8.254` | `192.168.8.255` |

---

## 🔌 Cabling & Infrastructure Layout
To minimize signal loss and maximize structural integrity:
- **Horizontal Cabling**: Belden 2413 UTP Cat6 (supporting up to 10 Gbps and 250 MHz frequency).
- **Vertical Backbone**: Single-Mode Corning OS2 Fiber Optic Cable (supporting 10 Gbps to 100 Gbps backbones across floors).
- **Terminations**: Tripp Lite 24-Port Cat6 Metal Patch Panels.
- **Connectors**: ZoeRax Shielded Gold-Plated Cat6A RJ45 to prevent electromagnetic interference (EMI).

### 📏 Cable Length Summary
- **Ground Floor Horizontal Cabling**: **265 meters**
- **First Floor Horizontal Cabling**: **253 meters**
- **Vertical Backbone Fiber Optic Cabling**: **150 meters**
- **Total Cabling Length**: **668 meters**
- **Total Patch Cords**: **112**
- **Total Switch Ports**: **28**

---

## 💻 Simulation & Modeling
The folder `/simulations/` contains the complete **Cisco Packet Tracer** network design files implementing:
1. Two-floor topology simulation.
2. VLAN routing and encapsulation on the Cisco Catalyst C8200L router.
3. DHCP scopes configured dynamically per subnet.
4. Wireless Access Point configurations matching the Ubiquiti layout.


---

## 💭 Course Reflection
Designing network topologies and subnetting IP addresses using Cisco Packet Tracer taught me how network components interact. This understanding of ports, routing, and gateways is essential when setting up secure cloud data networks and firewalls.
