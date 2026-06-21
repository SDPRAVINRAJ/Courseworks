// NAME : PRAVINRAJ A/L SIVABATHI , NO MATRIC: A23CS0171
// NAME: DHESHIEGHAN A/L SARAVANA MOORTHY, NO MATRIC: A23CS0072
// ASSIGNMENT3 SET 1

#include <iostream> 
#include <string> 
using namespace std; 
 
//Array declarations
const int MAX_BOOKS=100; 
string titles[MAX_BOOKS]; 
string authors[MAX_BOOKS]; 
string public_year[MAX_BOOKS]; 
 
 
int bookCount=0; 

// function prototypes
void displayMainMenu(); 
void addBook(); 
void displayLibrary(); 
void searchByTitle(const string& title); 
 
// function main
int main() 
{ 
  
 int choice; 
 do{ 
  
 displayMainMenu(); 
 cout<<"Enter your choice:\n"; 
 cin>>choice; 
  
 switch(choice){ 
  case 1: addBook(); 
   break; 
   
  case 2: displayLibrary(); 
   break; 
    
  case 3:{ 
     string title; 
    cout<<"Enter title to search:\n"; 
    cin>>title; 
    searchByTitle(title); 
   break; 
    } 
  case 4: cout<<"Goodbye!\n"; 
   break; 
   
  default:cout<<" Invalid input. Please enter 1,2,3,or 4"; 
  } 
}while (choice!=4); 
return 0; 
} 
 
// function displayMainMenu
void displayMainMenu() 
{ 
 cout<<"\n\n<<<<<Library Management System>>>>>\n"; 
 cout<<"===============================================\n"; 
 cout<<"1. Add a Book\n"; 
 cout<<"2. Display Library\n"; 
 cout<<"3. Search by Title\n"; 
 cout<<"4. Quit\n"; 
 
} 

// function addBook 
void addBook() 
{ 
 if(bookCount<MAX_BOOKS) 
 { 
  cout<<"Enter book title:\n"; 
  cin>>titles[bookCount]; 
   
  cout<<"Enter author name:\n"; 
  cin>>authors[bookCount]; 
   
  cout<<"Enter publication year:\n"; 
  cin>>public_year[bookCount]; 
   
  cout<<"Book added successfully!!\n"; 
  bookCount++; 
   
 } 
 else  
 cout<<"Cannot add more books because library is full!!\n"; 
} 

// function displayLibrary
void displayLibrary() 
{ 
 for (int i=0;i<bookCount;++i){ 
  
 if (bookCount>0) 
{ 
 cout<<"Library Contents:\n"; 
 cout<<"===============================\n";   
 cout<<"\n\nTitle:"<<titles[i]; 
 cout<<"\n\nAuthor:"<<authors[i]; 
 cout<<"\n\nYear:"<<public_year[i]; 
  
} 
 
else { 
 
cout<<"Library is empty\n"; 
 
} 
} 
} 

// function searchByTitle 
void searchByTitle(const std::string& title) { 
    bool found = false; 
 
    for (int i = 0; i < bookCount; ++i) { 
        if (titles[i] == title) { 
            cout << "\nBook Found:\n"; 
            cout << "Title: " << titles[i] << "\n"; 
            cout << "Author: " << authors[i] << "\n"; 
            cout << "Publication Year: " << public_year[i] << "\n"; 
            found = true; 
            break; 
        } 
    } 
 
if(!found){ 
 
 cout<<"Book not found in the library!\n"; 
} 
}

