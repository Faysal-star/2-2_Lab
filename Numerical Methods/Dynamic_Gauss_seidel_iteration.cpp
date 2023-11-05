#include<bits/stdc++.h>
using namespace std;
#define fast ios_base::sync_with_stdio(0);cin.tie(0)
typedef long long ll;

/*
To Apply Gauss Seidel Iteration Method , 
The matrix must be diagonally dominant matrix.
*/

/*
Input Format :
Number of Equation : 3

Equations :
4x+y+z=9
x+3y+z=10
2x+2y+5z=21

Max Iteration : 50
Error : .001
*/

const int N = 5 ;
double A[N][N], X[N] , Y[N];

void string_to_coefficient(string s , int i){
    int num = 0 ;
    int sign = 1 ;
    int idx = 0 ;
    if(s[0] == '-'){
        sign = -1 ;
        idx = 1 ;
    }
    for(int j = idx ; j < s.length() ; j++){
        if(s[j] <= '9' && s[j] >= '0'){
            num = num*10 + (s[j] - '0') ;
        }
        else if(s[j] == 'x'){
            if(num == 0) num = 1 ;
            A[i][1] = sign*num ;
            num = 0 ; sign = 1 ;
        }
        else if(s[j] == 'y'){
            if(num == 0) num = 1 ;
            A[i][2] = sign*num ;
            num = 0 ; sign = 1 ;
        }
        else if(s[j] == 'z'){
            if(num == 0) num = 1 ;
            A[i][3] = sign*num ;
            num = 0 ; sign = 1 ;
        }
        else if(s[j] == 'w'){
            if(num == 0) num = 1 ;
            A[i][4] = sign*num ;
            num = 0 ; sign = 1 ;
        }
        if(s[j] == '-') sign = -1 ;
        else if(s[j] == '+') sign = 1 ;
    }
    X[i] = sign*num ;
}

int main(){
    int n ;
    cout << "Enter the number of variables(mx:4) : " ;
    cin >> n ;
    cout << "Enter the equations : \n" ;
    for(int i = 1 ; i <= n ; i++){
        string s ;
        cin >> s ;
        string_to_coefficient(s , i);
    }

    cout << "\nCoefficient Matrix: \n" ;
    for(int i = 1 ; i <= n ; i++){
        for(int j = 1 ; j <= n ; j++){
            cout << A[i][j] << "  " ;
        }
        cout << "\t" << X[i] << endl ;
    }

    cout << "\nGauss Seidel Iteration : \n" ;
    int mx_itr = 0 ;
    cout << "Enter the maximum number of iteration : " ;
    cin >> mx_itr ;
    double eps = 0 ;
    cout << "Enter the error : " ;
    cin >> eps ;
    double sol[n+1] ;
    for(int i = 1 ; i <= n ; i++) sol[i] = 0 ;
    while(mx_itr--){
        for(int i = 1 ; i <= n ; i++){
            double sum = 0 ;
            for(int j = 1 ; j <= n ; j++){
                if(i != j) sum += A[i][j]*sol[j] ;
            }
            sol[i] = (X[i] - sum)/A[i][i] ;
        }
        bool ok = true ;
        for(int i = 1 ; i <= n ; i++){
            if(abs(sol[i] - Y[i]) > eps) ok = false ;
            Y[i] = sol[i] ;
            cout << "x" << i << " = " << sol[i] << "\t" ;
        }
        if(ok) break ;
        cout << endl ;
    }
    cout << "\nSolution : \n" ;
    for(int i = 1 ; i <= n ; i++) cout << "x" << i << " = " << sol[i] << endl ;
}