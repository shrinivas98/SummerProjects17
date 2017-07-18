    #include<iostream>
    #include <bits/stdc++.h>
    using namespace std;
    int main()
    {
    int t,n,k,i,j,temp,sum1,sum2;
    cin>>t;
    while(t--)
    {
    cin>>n>>k;
    int a[n];
    for(i=0;i<n;i++)
    cin>>a[i];
    for(i=0;i<n-1;i++)
    {
    for(j=i+1;j<n;j++)
    {
    if(a[i]<a[j])
    {
    temp=a[i];
    a[i]=a[j];
    a[j]=temp;
    }
    }
    }
    sum1=0;
    sum2=0;
    if(k>n/2)
    {
    for(i=0;i<k;i++)
    sum2+=a[i];
    for(i=k;i<n;i++)
    sum1+=a[i];
    }
    else
    {
    for(i=0;i<n-k;i++)
    sum2+=a[i];
    for(i=n-k;i<n;i++)
    sum1+=a[i];
    }
    printf("%d\n",sum2-sum1);
    }
    return 0;
    }
