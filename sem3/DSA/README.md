# Interview Simulation System

## Overview
This project is a C++ console-based Interview Simulation System. It manages candidates using a queue data structure based on a singly linked list. Candidates are added to a waiting queue, processed in FIFO order, assigned an interview time slot, and then moved to a processed candidates list.

## Main Features
- Add new candidate with automatic ID generation.
- Store candidate name, ID, age, slot, and status.
- Process the next candidate in queue order.
- Assign one of five interview slots.
- View waiting candidates and processed candidates.
- View total candidates currently waiting in the queue.
- Clear memory using destructor logic.

## Technologies Used
- C++
- Console input/output
- Linked list
- Queue data structure
- Dynamic memory allocation using `new` and `delete`

## Interview Time Slots
| Slot | Time |
|---|---|
| 1 | 9:00 AM - 10:00 AM |
| 2 | 10:30 AM - 11:30 AM |
| 3 | 1:00 PM - 2:00 PM |
| 4 | 2:30 PM - 3:30 PM |
| 5 | 4:00 PM - 5:00 PM |

## How the Program Works
1. The user selects an option from the main menu.
2. New candidates are inserted at the rear of the queue.
3. The next candidate is always taken from the front of the queue.
4. The user assigns an interview slot from 1 to 5.
5. The processed candidate is removed from the waiting queue and saved in the processed list.
6. The program repeats until the user selects Exit.

## Menu Options
```text
=== Interview Simulation System ===
1. Add New Candidate
2. Process Next Candidate & Assign Slot
3. View Current Queue
4. View Total Candidates
5. Exit
```

## Compile and Run
Because the program uses `#include <windows.h>`, it is best compiled on Windows.

### Using g++ on Windows
```bash
g++ "Pasted code.cpp" -o interview_system
./interview_system
```

### Using Visual Studio / Code::Blocks
1. Create a new C++ console project.
2. Add the source code file.
3. Build the project.
4. Run the executable.

## Important Notes
- The system stores data only during runtime.
- Candidate records are not saved after exit.
- The total candidate count refers to candidates still waiting in the queue.
- The program currently allows multiple candidates to use the same interview slot.

## Limitations
- Windows-specific due to `Sleep()` and `system("cls")`.
- No file handling or database storage.
- No duplicate slot prevention.
- Limited input validation.
- No edit, search, or delete candidate function.

## Future Improvements
- Add file saving and loading.
- Add slot availability checking.
- Add search candidate by ID or name.
- Add edit and delete candidate features.
- Add stronger input validation.
- Make the code cross-platform.

## Data Structure Used
The main data structure is a queue implemented using a linked list. Each candidate node points to the next candidate using the `next` pointer.

```cpp
struct Candidate {
    string name;
    int id;
    int age;
    int slot;
    string status;
    Candidate *next;
};
```

## Author / Submission
Prepared as a coursework project report based on the provided C++ source code.
