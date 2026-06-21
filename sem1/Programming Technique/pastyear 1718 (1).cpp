#include <iostream>
#include <iomanip>
using namespace std;
void readScores(string name[],int score[]){
    for(int i=0;i<10;i++){
        cout<<"Enter Player "<<(i+1)<<"'s name and score: ";
        cin>>name[i]>>score[i];
    }
}

int getHighestScore(int score[]){
    int highest=score[0];
    int highestindex=0;
    for(int i=1;i<10;i++){
        if(score[i]>highest){
            highest=score[i];
            highestindex=i;
            }
    }
    return highestindex;
}

int getLowestScore(int score[]){
    int lowest=score[0];
    int lowestindex=0;
    for(int i=1;i<10;i++){
        if(score[i]<lowest){
            lowest=score[i];
            lowestindex=i;
        }
    }
    return lowestindex;
}

double averagescore(int score[]){
    double total=0;
    for(int i=0;i<10;i++){
       total+=score[i];
    }
    return(total/10);
}

int main(){
    string name[10];
    int score[10];
    readScores(name,score);
    cout<<endl<<endl;
    cout<<"PLAYER'S NAME"<<setw(15)<<"SCORES"<<endl;
    cout<<"============="<<setw(15)<<"======"<<endl;
    for(int i=0;i<10;i++){
        cout<<left<<setw(23)<<name[i]<<setw(15)<<score[i]<<endl;
    }
    cout<<endl;
    cout<<"HIGHEST SCORE"<<setw(5)<<": "<<score[getHighestScore(score)]<<" ("<<name[getHighestScore(score)]<<")"<<endl<<endl;
    cout<<"LOWEST SCORE"<<setw(6)<<": "<<score[getLowestScore(score)]<<" ("<<name[getLowestScore(score)]<<")"<<endl<<endl;
    cout<<"AVERAGE SCORE"<<setw(5)<<": "<<averagescore(score)<<endl;
    system("pause");
    return 0;
}