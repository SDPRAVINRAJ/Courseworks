# 🧵 Process Synchronization using Peterson's Algorithm
### SECR2043 Operating System Project — Group Pacman (Section 02)

Welcome to the **Operating System** repository. This project demonstrates the implementation of **Peterson's Algorithm** in C++ to solve the critical section problem for two concurrent threads (representing processes), ensuring mutual exclusion, progress, and bounded waiting.

---

## 📂 Repository Structure
```text
├───docs
│       OS_Group_Project_Report.pdf        # Comprehensive academic project report
│
└───src
        main.cpp                           # C++ implementation using standard threads
```

---

## 🏫 Project Overview
- **Course**: SECR2043 Operating System (Section 02)
- **Institution**: Universiti Teknologi Malaysia (UTM)
- **Lecturer**: Dr. Muhammad Zafran Bin Muhammad Zaly Shah
- **Group Name**: Pacman
- **Submission Date**: 6/7/2025
- **Group Members**:
  - Ling Lee Hom (A23CS0105)
  - Pravinraj A/L Sivabathi (A23CS0171)
  - Justin Fauzadani Azka (A23CS4012)
  - Dheshieghan A/L Saravana Moorthy (A23CS0072)
  - Harresh A/L Uthayakumar (A23CS0226)

### 📹 Presentation Video Link
You can view the detailed video presentation demonstrating our code execution and theoretical overview here:
👉 **[Google Drive Presentation Folder](https://drive.google.com/drive/folders/1as81sKcUVAvYoDlbPtZzTwTJnAmuahNm)**

---

## ⚙️ Peterson's Algorithm Mechanics

Peterson's algorithm is a software-based solution designed to synchronize access to a shared resource between two processes. It utilizes two shared synchronization variables:
1. `atomic<bool> flag[2]`: Indicates if a process/thread intends to enter the critical section.
2. `atomic<int> turn`: Holds the ID of the thread that has priority to enter the critical section next.

### Algorithm Flow
- **Entry Section**:
  ```cpp
  flag[id] = true;
  turn = other;
  while (flag[other] && turn == other) {
      // Busy waiting (spins until the other thread yields)
  }
  ```
- **Critical Section**:
  The thread performs its execution on the shared resource (simulated by a printer queue incrementing `sharedPrinterCounter`).
- **Exit Section**:
  ```cpp
  flag[id] = false; // Release the lock
  ```
- **Remainder Section**:
  Non-critical work is performed outside of the synchronized block.

---

## 💻 C++ Implementation Details
The simulation in `src/main.cpp` mimics **Alice (ID 0)** and **Bob (ID 1)** trying to access a shared printer:
- Utilizes `std::thread` to manage concurrent executions.
- Employs C++11 `<atomic>` variables (`atomic<bool>`, `atomic<int>`) to prevent memory reordering issues and cache inconsistency, which could otherwise break Peterson's algorithm on modern multicore processors.
- Simulated sleep delays of `100ms` force thread interleaving to demonstrate mutual exclusion.

---

## 🚀 Compilation & Run Instructions

To compile and execute the simulation locally, follow these steps:

### 1. Requirements
Ensure you have a modern compiler supporting C++11 or higher (e.g., GCC/G++).

### 2. Compilation Command
Run the following command in your terminal from the `src/` directory:
```bash
g++ -std=c++11 -pthread main.cpp -o peterson_simulation
```

### 3. Execution
Run the compiled executable:
- **Linux/macOS**:
  ```bash
  ./peterson_simulation
  ```
- **Windows**:
  ```cmd
  peterson_simulation.exe
  ```
