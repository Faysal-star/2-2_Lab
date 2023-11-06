#include<bits/stdc++.h>
using namespace std;
#define fast ios_base::sync_with_stdio(0);cin.tie(0)
typedef long long ll;

/*
Input Format :
4x^4-2x^3+5x^2-6x^1+1
0.5 2
*/

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

float falsep(float x1 , float x2){
    return x1-((fx(x1)*(x2-x1)) / (fx(x2)-fx(x1))) ;
}


int main(){
    string s ; cin >> s ;
    string_to_coefficient(s);
    
    for(auto it : pw) cout << it.second << "\tx^\t" << it.first << "\n";
    cout << endl ;

    cout << "Enter range : " ;
    float x1 , x2 , x0 ;
    cin >> x1 >> x2 ;

    cout << "Initial range : " ;
    cout << fx(x1) << " " << fx(x2) << endl ;

    if(fx(x1)*fx(x2) >= 0){
        cout << "No Solution\n" ;
    }
    else{
        int itr = 0 ;
        x0 = falsep(x1 , x2);
        while(abs(fx(x0)) > 0.00001){
            if(fx(x0)*fx(x2) < 0) x1 = x0 ;
            else x2 = x0 ;
            x0 = falsep(x1 , x2) ;
            if(itr++ > 100) break ;
        }
        cout << "Ans : " << x0 << endl ;
    }   
}