#include<bits/stdc++.h>
using namespace std;
#define fast ios_base::sync_with_stdio(0);cin.tie(0)
typedef long long ll;

// Equation format : 4x^3-2x^2+3x^1+4 

map<int , int> pw ;
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


int main(){
    string s ; cin >> s ;
    string_to_coefficient(s);
    
    for(auto it : pw) cout << it.second << "\tx^\t" << it.first << "\n";
    cout << endl ;
    cout << fx(2.2) << endl;
    cout << dx(2.2) << endl;
}