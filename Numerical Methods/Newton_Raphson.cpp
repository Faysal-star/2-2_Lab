#include<bits/stdc++.h>
using namespace std;
#define fast ios_base::sync_with_stdio(0);cin.tie(0)
typedef long long ll;
map<int , int> pw ;

/*
Input Format :
4x^4-2x^3+5x^2-6x^1+1
-10 10
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

float dx(float x){
    float ans = 0 ;
    for(auto it : pw) ans += it.second*it.first*pow(x*1.0,it.first-1);
    return ans ;
}

double initial_guess(int l , int r){
    int min = l ;
    for(int i = l ; i <= r ; i++){
        if(i==0) continue ;
        if(abs(fx(i)) < abs(fx(min))) min = i ;
    }
    return min ;
}

void newton_raphson(){
    double x1 , x;
    cout << "Enter Interval : " ;
    int l , r;
    cin >> l >> r ;
    x1 = initial_guess(min(l,r) , max(l,r));
    cout << "Initial Guess taken : " << x1 << endl ;
    int it = 0 ;
    while(it++ < 100){
        x = x1 - (fx(x1) / dx(x1)) ;
        cout << "it " << it << " : " << x << endl ;
        if(abs(x-x1) < 0.0001){
            cout << "Ans : " << x << endl ;
            return ;
        }
        x1 = x ;
    }
    if(it >= 100) cout << "Not convergent \n" ;
}

int main(){
    cout << "Enter : " ;
    string s ;
    cin >> s ;
    string_to_coefficient(s) ;
    for(auto it : pw) cout << it.second << "\tx^\t" << it.first << " \n" ;
    newton_raphson() ;
}