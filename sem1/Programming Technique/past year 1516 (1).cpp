#include <iostream>
#include <iomanip>
#include <cmath>
using namespace std;

void inputNumbers(int[],int);
double sum(int[],int);
double avrg(int[],int);
double f(int[],int[],int,int);

void inputNumbers(int num[],int amount){
    for(int i=0;i<amount;i++){
        cout<<"Enter number "<<(i+1)<<"=> ";
        cin>>num[i];
    }
    cout<<endl;
}

double sum(int num[],int amount){
    double total=0;
    for(int i=0;i<amount;i++){
        total+=num[i];
    }
    return total;
}

double avrg (int num[],int amount){
    double total=sum(num,amount);
    double average=total/amount;
    return average;
}

double f(int X[],int Y[],int amount1,int amount2){
    double ans=sqrt(avrg(X,amount1)+avrg(Y,amount2));
    return ans;
}

int main(){
    int amount1,amount2;
    int list1[100];
    int list2[100];
    cout<<"List 1"<<endl;
    cout<<"How many numbers do you want to enter? => ";
    cin>>amount1;
    inputNumbers(list1,amount1);
    cout<<"List 2"<<endl;
    cout<<"How many numbers do you want to enter? => ";
    cin>>amount2;
    inputNumbers(list2,amount2);
    cout<<"The value of function f = "<<fixed<<setprecision(5)<<f(list1,list2,amount1,amount2)<<endl;
    system("pause");
    return 0;
}
