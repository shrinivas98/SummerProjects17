    #include <bits/stdc++.h>
    using namespace std ;
      int main(){
        int T,N ;
        cin >> T ;
        while(T --){
     
            cin >> N ;
            string s , ans ;
            cin >> s ;
            ans = s ;
            for(int j=0;j<N;j++){
                string temp ;
                for(int i=0;i<N;i++){
                    if(i != j)
                        temp += s[i] ;
                }
                bool ok = 0 ;
                string str ;
                for(int i=0;i<N-1;i++){
                    if(temp[i] > s[j] && !ok){
                        str += s[j] ;
                        str += temp[i] ;
                        ok = 1 ;
                    }else{
                        str += temp[i] ;
                    }
                }
                if(!ok)
                    str += s[j] ;
                ans = min(ans,str) ;
            }
            cout << ans << endl ;
        }
        return 0 ;
    } 
