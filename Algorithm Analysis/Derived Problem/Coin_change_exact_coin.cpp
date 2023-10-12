#include<bits/stdc++.h>
using namespace std;
int coin[1000] , dp[100][100][100] ;
int coin_change(int n , int sum , int k){
    if(n == 0 || sum < 0 || k < 0) return 0 ;
    if(sum == 0 && k == 0) return 1 ;
    if(dp[n][sum][k] != -1) return dp[n][sum][k] ;
    return dp[n][sum][k] = (coin_change(n , sum - coin[n-1] , k-1) || coin_change(n-1 , sum , k)) ;
}

int main(){
    int n , k , sum ;
    cin >> n >> k >> sum ;
    for(int i = 0 ; i < n ; i++) cin >> coin[i] ;
    memset(dp , -1 , sizeof(dp)) ;
    coin_change(n , sum , k) ; 
    cout << (dp[n][sum][k] ? "YES" : "NO") ;
}