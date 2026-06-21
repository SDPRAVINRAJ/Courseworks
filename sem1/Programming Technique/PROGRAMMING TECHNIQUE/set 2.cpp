// ASSIGNMENT 2 SET 2
/* NAME: PRAVINRAJ A/L SIVABATHI,  NO MATRIC : A23CS0171*/
/* NAME: DESHDHESHIEGHAN A/L SARAVANA MOORTHY, NO MATRIC :	A23CS0072*/
# include <iostream>
using namespace std;
int main(){
cout << "Welcome to the Food Ordering System "<< endl;
cout << "1. Pizza - $10 "<<endl;
cout << "2. Burger - $5" << endl;
cout << "3. Sandwich - $7"<< endl;
int noitem,totalbill;
cout << "Enter the number of the item you want to order: ";
cin >> noitem;
if (noitem ==1) 
   totalbill = 10;
else if (noitem ==2)
   totalbill = 5;
else if (noitem == 3)
   totalbill = 3;
else 
   cout << "INVALID INPUT";
cout << "Your total bill is: $ "  << totalbill <<"\n
";
return 0; 
}
