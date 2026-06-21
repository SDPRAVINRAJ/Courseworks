# Computer Organization & Architecture (COA)
## Lab Exercises, Assembly Programs, and System Benchmarks

This repository contains academic laboratory works, custom low-level assembly programs, and hardware benchmark analysis reports for Computer Organization & Architecture.

---

## 📂 Repository Structure
```text
├───benchmarks
│       Dell_Inspiron_16_5625_Geekbench.pdf        # Geekbench hardware benchmark details
│
└───labs
    ├───assembly-tasks
    │       part1_hexagon_perimeter.asm             # x86 Hexagon perimeter calculation (Loops)
    │       part2_array_sum_odd_even.asm            # Array summation by even/odd index positions
    │       part3_menu_driven_math.asm              # Menu-driven x86 console utility integrating both parts
    │
    └───lab-1
        │   Lab_1_COA_Questions.docx                # Laboratory lab sheet questions
        │
        └───projects
            ├───lab 1a                              # Visual Studio MASM template projects
            ├───Lab 1b
            └───Lab 1c
```

---

## 💻 Assembly Programs (x86 / MASM / Irvine32)
All assembly programs are written in **x86 Intel Assembly** and target the **Irvine32 link library**.

### 1. Hexagon Perimeter Calculator (`/labs/assembly-tasks/part1_hexagon_perimeter.asm`)
- **Objective**: Computes the perimeter of two hexagons given their side lengths.
- **Logic**: Reads decimal values using `ReadInt`, sets the loop counter `ecx` to 6, accumulates the side length value 6 times using loop additions, and prints results with `WriteInt`.

### 2. Even/Odd Array Index Summation (`/labs/assembly-tasks/part2_array_sum_odd_even.asm`)
- **Objective**: Sums up elements located at even and odd positions inside a 6-element integer array.
- **Logic**: Loops 6 times to store user inputs into a double-word array (`HELLO`). Calculates the even summation by fetching index offsets `0, 8, 16` (0, 2, 4) and the odd summation using index offsets `4, 12, 20` (1, 3, 5).

### 3. Menu-Driven Console Utility (`/labs/assembly-tasks/part3_menu_driven_math.asm`)
- **Objective**: Integrates both the hexagon perimeter calculator and the array summation routines under a unified user menu.
- **Controls**: Users can select options via console input and choose to loop back to the main menu (entering `'y'`) or terminate the benchmark (entering `'n'`).

---

## 🖥️ System Performance Benchmarks (`/benchmarks/`)
- Includes a comprehensive Geekbench benchmark report (`Dell_Inspiron_16_5625_Geekbench.pdf`) detailing processor, memory, cache hierarchy, and execution performance for a Dell Inspiron 16 5625 system powered by the **AMD Ryzen 5 5625U** processor.


---

## 💭 Course Reflection
Studying assembly programming and ALU architecture in this course gave me a deep appreciation for hardware execution limits. Knowing how instructions and caches behave helps me write more hardware-friendly, low-level scripts.
