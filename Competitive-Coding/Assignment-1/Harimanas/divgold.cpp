#include<bits/stdc++.h>
using namespace std;
int main()
{

int t;
scanf("%d",&t);
while(t--)
{  int n1,i,j;
 scanf("%d",&n1);
 string small,s1,s2;
 cin>>s1;
 small=s1;
 s2=s1;
 string temp;
 int n=1;
 for(i=0;i<n1;i++)
 {   temp=s1[i];
     s2=s1;
     n=1;
     for(j=0;j<n1;j++)
     {
          s2.erase(s2.begin()+i);
           s2.insert(j,temp);

          small=min(small,s2);
          s2=s1;

      }
  }
cout<<small;
printf("\n");

}
return 0;
}
