# Digital Logic

Welcome to the **Digital Logic** coursework folder. This repository compiles key experiments, designs, and simulations exploring the foundational hardware elements of computer systems. Through combinational and sequential logic design, these activities bridge mathematical Boolean logic with physical micro-architecture implementation.

---

## 🛠️ What We Did

This folder contains reports and schematics illustrating the design, simulation, and verification of digital circuits:

### 1. Deeds Simulation & Basic Logic Gates (`deeds1.pdf`)
*   **Concepts Explored:** Basic logic gate operations, logic equations, and truth tables.
*   **Implementation:** Using the **Deeds (Digital Electronics Education and Design Suite)** simulation software to construct and verify:
    *   **AND Gate:** $F = A \cdot B$ (Outputs high only when both inputs are high).
    *   **NAND Gate:** $F = \overline{A \cdot B}$ (Inverse of AND; behaves as a universal gate).
    *   **XOR Gate:** $F = A\overline{B} + \overline{A}B$ (Outputs high only when the inputs differ).
*   **Key Action:** Constructed circuit schematics, inputted binary sequences, and verified output states against theoretical truth tables.

### 2. Multiplexers and Demultiplexers (`mux demux.pdf`)
*   **Concepts Explored:** Combinational routing logic.
*   **Implementation:**
    *   **Multiplexers (MUX):** Data selectors that channel one of $2^n$ input lines to a single output line based on $n$ select inputs.
    *   **Demultiplexers (DEMUX):** Data distributors that route a single input to one of $2^n$ output lines based on $n$ select inputs.
*   **Key Action:** Designed MUX/DEMUX circuit schematics to route data streams dynamically, simulating selection lines and verifying signal paths.

### 3. JK Flip-Flop Sequential Circuit (`JK FF.pdf`)
*   **Concepts Explored:** Transitioning from combinational logic to sequential (state-retaining) logic.
*   **Implementation:** Analyzing the bistable multivibrator circuit (JK Flip-Flop).
    *   Studied the truth table, excitation table, and state transitions.
    *   Explored the **Toggle State** ($J=1, K=1$), which forms the basis for binary counters.
*   **Key Action:** Traced timing diagrams and analyzed clock-edge triggering behavior, including setup/hold times and asynchronous Preset/Clear overrides.

### 4. 4-Bit JK Flip-Flop Sequential Designs (`JK FF 4 Bit.pdf`)
*   **Concepts Explored:** Multi-bit memory arrays and counting sequences.
*   **Implementation:** Designing a 4-bit sequential circuit (such as a ripple counter or shift register) using four cascaded JK Flip-Flops.
*   **Key Action:** Designed the connections where the output of one flip-flop triggers the clock input of the next (asynchronous cascading), enabling counting from $0000$ to $1111$ (decimal $0$ to $15$).

---

## 🧠 What We Learnt

*   **Boolean Simplification:** Mastered simplifying complex boolean expressions using algebraic laws and Karnaugh Maps (K-Maps) to minimize the number of logic gates needed in a physical design.
*   **Difference Between Combinational and Sequential Circuits:**
    *   **Combinational:** Outputs depend solely on the current inputs (e.g., AND, MUX).
    *   **Sequential:** Outputs depend on current inputs and the history of inputs (state), requiring a clock signal to synchronize state transitions (e.g., Flip-Flops, Registers, Counters).
*   **Tool Competency (Deeds Suite):** Gained proficiency in using professional simulation environments to design schematics, model time delays, analyze logic wave diagrams, and troubleshoot circuit faults.

---

## 💡 Reflection

> Learning about digital logic, Deeds simulation, and facing various circuit challenges felt like uncovering secrets about how computers work at the hardware level. It was very much like solving intricate logic puzzles; overcoming layout challenges and debugging timing issues brought a great sense of accomplishment—similar to winning small battles. 
>
> This subject has not only taught us fundamental hardware and technical concepts but has also significantly sharpened our logical troubleshooting and problem-solving skills. Overall, it has been an eye-opening and rewarding journey into the world of digital architecture.

---
[← Back to Semester 1 Portfolio](../README.md)