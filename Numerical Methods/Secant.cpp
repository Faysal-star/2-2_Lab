#include<bits/stdc++.h>
using namespace std;
#define fast ios_base::sync_with_stdio(0);cin.tie(0)
typedef long long ll;
map<int , int> pw ;

/*
Input Format :
1x^2-4x^1-10
5 3
*/

void string_to_coefficient(string s){
    for(int i = 0 ; i < s.length() ; i++){
        int coeff = atol(s.substr(i).c_str());
        i+=log10(abs(coeff))+1;
        int power = 0 ;
        for(int j = i ; j < s.length() ; j++){
            if(s[j] == '^'){
                power = atol(s.substr(j+1).c_str());
                i=j+log10(power)+1 ;
                break;
            }
        }
        pw[power] += coeff;
    }
}

float fx(float x){
    float ans = 0 ;
    for(auto it : pw) ans += it.second*pow(x*1.0,it.first);
    return ans ;
}

void secant(){
    cout << "Enter Initial Guess : " ;
    double x3 , x1 , x2 ;
    cin >> x1 >> x2 ;
    int it = 0 ;
    while(it++ < 100){
        x3 = x2 - (fx(x2)*(x2-x1))/(fx(x2)-fx(x1)) ;
        cout << "it " << it << " : " << x3 << endl ;
        if(abs(x3-x2) < 0.0001){
            cout << "Root : " << x3 << endl ;
            return ;
        }
        x1 = x2 ;
        x2 = x3 ;
    }
    cout << "Estimate Root : " << x3 << endl ;
}

int main(){
    cout << "Enter : " ;
    string s ;
    cin >> s ;
    string_to_coefficient(s) ;
    for(auto it : pw) cout << it.second << "\tx^\t" << it.first << " \n" ;
    secant() ;
}