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

# 💡 Reflection

Operating System was one of the most fundamental courses in my Computer Science degree because it provided a deeper understanding of how modern computer systems manage processes, memory, resources, and synchronization. Through this course, I learned the importance of operating systems in ensuring efficient and reliable execution of programs.

For our group project, we implemented **Peterson's Algorithm** using C++ to solve the critical section problem and demonstrate process synchronization between concurrent threads. This project allowed me to understand how synchronization mechanisms prevent race conditions and ensure mutual exclusion when multiple processes attempt to access shared resources simultaneously.

One of the most valuable lessons from this project was learning how theoretical concepts taught in lectures can be translated into practical implementations. By developing the simulation using threads and atomic variables, I gained hands-on experience with concurrent programming and observed how synchronization algorithms maintain system correctness even in multitasking environments.

The project also strengthened my problem-solving, debugging, and programming skills. Understanding concepts such as mutual exclusion, progress, bounded waiting, race conditions, and process coordination gave me a stronger appreciation for the complexity involved in operating system design.

Working as a team further improved my communication and collaboration skills while exposing me to different approaches for solving technical problems. Overall, this course enhanced my understanding of low-level system operations and provided a strong foundation for future studies in distributed systems, cloud computing, high-performance computing, and software engineering.

The knowledge gained from Operating System is highly relevant to my future career as a Data Engineer because modern data platforms, cloud services, and distributed computing environments rely heavily on efficient resource management, process scheduling, concurrency control, and system optimization.

---

# 🛠️ Skills Developed

- Operating System Fundamentals
- Process Synchronization
- Peterson's Algorithm
- Multithreading
- Concurrent Programming
- C++ Programming
- Atomic Variables
- Critical Section Management
- Race Condition Prevention
- Problem Solving
- Debugging
- Team Collaboration

---

# 🚀 Future Learning Goals

After completing this course, I would like to further explore:

- Distributed Systems
- Cloud Computing
- Parallel Computing
- High Performance Computing
- Linux System Administration
- Containerization Technologies
- Kubernetes
- System Performance Optimization

---

# 📌 Conclusion

Operating System provided valuable insights into how computer systems manage resources, processes, and synchronization. Through the implementation of Peterson's Algorithm, I gained practical experience in concurrent programming and process coordination. The knowledge and skills developed throughout this course have strengthened my understanding of system-level computing and provided a solid foundation for future studies and careers involving cloud platforms, distributed systems, and Data Engineering.

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
