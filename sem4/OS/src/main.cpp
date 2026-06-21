#include <iostream>
#include <thread>
#include <atomic>
#include <chrono>

using namespace std;

// Shared variables
atomic<bool> flag[2];  
atomic<int> turn;      

// Shared resource
int sharedPrinterCounter = 0;

void usePrinter(int id) {
    int other = 1 - id;

    for (int i = 0; i < 5; i++) { // Each thread tries 5 times
        // Entry section
        flag[id] = true;
        turn = other;

        
        while (flag[other] && turn == other) {
            // Busy wait
        }

        // Critical section
        cout << (id == 0 ? "Alice" : "Bob") << " is using the printer...\n";
        int temp = sharedPrinterCounter;
        this_thread::sleep_for(chrono::milliseconds(100)); // Simulate some work
        sharedPrinterCounter = temp + 1;
        cout << (id == 0 ? "Alice" : "Bob") << " finished printing. Total prints: " << sharedPrinterCounter << "\n";

        // Exit section
        flag[id] = false;

        // Remainder section
        this_thread::sleep_for(chrono::milliseconds(100));
    }
}

int main() {

    flag[0] = false;
    flag[1] = false;
    thread alice(usePrinter, 0);


    thread bob(usePrinter, 1);


    alice.join();
    bob.join();

    cout << "All printing jobs completed.\n";
    return 0;
}
