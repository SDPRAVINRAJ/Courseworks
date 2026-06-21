// ASSIGNMENT 2 SET 1
/* NAME: PRAVINRAJ A/L SIVABATHI,  NO MATRIC : A23CS0171*/
/* NAME: DESHDHESHIEGHAN A/L SARAVANA MOORTHY, NO MATRIC :	A23CS0072*/
#include <iostream>
#include <string>

using namespace std;

//function declaration
void displayAccountInfo(double& balance, string& name, string& accountnum);
void deposit(double& balance, int add);
void withdraw(double& current_balance, int sub);

// main function
int main() {
    char answer;
    do {
        double balance =0;
        string name, accountnum;  
        displayAccountInfo(balance, name, accountnum);
        deposit(balance, 500);
        withdraw(balance, 200);
cout << "\n<<<<< My Accounts Overview >>>>>\n";
        cout << "Account Holder Name:" << name << endl;
        cout << "Account Number:" << accountnum << endl;
        cout << "Balance: RM " << balance << endl;

        cout << "\nDo you want to perform another transaction? (Enter 'Y' for Yes, 'N' for No): ";
        cin >> answer;
		cout << "\n";
    } while (answer == 'y' || answer == 'Y');
    
    
    
    return 0;
}
// function displayAccountInfo
void displayAccountInfo(double& balance, string& name, string& accountnum) {
    cout << "<<<<< My Accounts Overview >>>>>\n";
    cout << "Account Holder Name: ";
    cin >> name;
    cout << "Account Number: ";
    cin >> accountnum;
    cout << "Balance: RM " ;
    cin >> balance;
}
// function deposit
void deposit(double& balance, int add) {
    balance = balance + add; 
    cout << "\n<<<<< Deposit Transaction >>>>>\n";
    cout << "Deposit of RM 500 successful.\n";
}
// function withdraw
void withdraw(double& current_balance, int sub) {
    cout << "\n<<<<< Withdrawal Transaction >>>>>\n"; 
    if (current_balance >= sub) {
        current_balance = current_balance - sub;
        cout << "Withdrawal of RM " << sub << " successful.\n";
    } else {
        cout << "Insufficient funds for withdrawal.\n";
    }
}

