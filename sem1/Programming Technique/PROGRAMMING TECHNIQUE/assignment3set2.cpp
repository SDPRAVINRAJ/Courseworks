// NAME : PRAVINRAJ A/L SIVABATHI , NO MATRIC: A23CS0171
// NAME: DHESHIEGHAN A/L SARAVANA MOORTHY, NO MATRIC: A23CS0072
// ASSIGNMENT 3 SET 2

#include <iostream>
using namespace std;

//Array declarations
const int MAX_OPERATIONS = 100;
int operands1[MAX_OPERATIONS];
int results[MAX_OPERATIONS];

// Function prototypes
void displayMainMenu();
void multiplyUsingAddition(int a, int b, int &result); 
void performMultiplication(int &operationCount);
void displayResults(int operationCount);

//function main
int main() {
    int operationCount = 0;
    int choice;

    do {
        displayMainMenu();
        cout << "Enter your choice: ";
        cin >> choice;
        cout <<endl;

        if (choice == 1) 
             performMultiplication(operationCount);
        
		else if (choice == 2) 
              displayResults(operationCount);
            
        else if (choice == 3) 
            cout << "Exiting the program. Goodbye!"<<endl;
            
        else 
            cout << "INVALID INPUT. TRY AGAIN"<<endl;
        
    } while (choice != 3);

    return 0;
}

// function displayMainMenu
void displayMainMenu() {
    cout << "\n<<<<<Main Menu>>>>> " << endl;
    cout << "============================= " << endl;
    cout << "1. Perform Multiplication " << endl;
    cout << "2. Display Results " << endl;
    cout << "3. Quit " << endl;
    
}

// function multiplyUsingAddition
void multiplyUsingAddition(int a, int b, int &result) {
    result = 0;

    for (int i = 0; i < a; i++) {
        result += b;
    }
}

// function performMultiplication
void performMultiplication(int &operationCount) {
    int num_operand;
    int result = 1;
    int operand;

    cout << "Enter the number of operands for multiplication: ";
    cin >> num_operand;

    while (num_operand < 2) {
    	cout <<endl;
        cout << "Invalid number of operands. Please enter a number greater than 1: ";
        cin >> num_operand;
    }

    for (int i = 0; i < num_operand; i++) {
        cout << "Enter operand " << (i + 1) << ": ";
        cin >> operand;

        multiplyUsingAddition(operand, result, result);
        operands1[operationCount] = operand;
    }

    results[operationCount] = result;
    operationCount++;
    cout <<endl;
    cout << "Multiplication performed successfully!" << endl;
}

// function displayResults
void displayResults(int operationCount) {
    cout << "Results of Mathematical Operations :" << endl;
    cout << "==================================" << endl;

    for (int i = 0; i < operationCount; i++) {
        cout << "Operation " << (i + 1) << ": " << results[i] << " (Operands: " << operands1[i] << ")" << endl;
    }
}
