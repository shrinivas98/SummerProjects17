    #include<iostream>
    using namespace std;
    int main()
    {
    int x;
    double s,d;
    cin>>x>>s;
    if(x%5==0&&x+.50<=s)
    {
    printf("%.2f",s-x-.5);
    }
    else
    printf("%.2f",s);
    return 0;
    } 
