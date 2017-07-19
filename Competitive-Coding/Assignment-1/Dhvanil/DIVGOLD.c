    #include<stdio.h>
    #include<string.h>
    int main()
    {
        int t;
        int n,j;
        char temp;
        char s[1000];
        char s2[1000],hmm[2000];
        scanf("%d",&t);
        while(t--)
        {
                //fflush(stdin);
                scanf("%d",&n);
                fflush(stdin);
                scanf("%s",s);
                strcpy(s2,s);
                strcpy(hmm,s);
                int i,k;
                char x;
                for(i=n-1;i>=0;i--)
                {
     
     
     
                    strcpy(s,s2);
                        x=s[i];
                        for(k=1;k<i+1;k++)
                        {
                            strcpy(s,s2);
     
                           int  m=0;
                            for(j=i-1;1;j--)
                            {
                                s[j+1]=s[j];
                                m++;
                                if(m==k)
                                {
     
     
                                    break;
                                }
                            }
                            s[j]=x;
                       //   printf("%s\n",s);
                            if(strcmp(s,hmm)<0)
                            {
     
     
                                strcpy(hmm,s);
                            }
     
     
                        }
                    }
                    for(i=0;i<n-1;i++)
                    {
                        strcpy(s,s2);
                        x=s[i];
     
                        for(k=1;k<=n-1-i;k++)
                        {
                            strcpy(s,s2);
                                    int m=0;
                            for(j=i+1;1;j++)
                            {
                                s[j-1]=s[j];
                                m++;
                                if(m==k)
                                {
     
     
                                    break;
                                }
                            }
                            s[j]=x;
                         //.   printf("%s\n",s);
                          //   printf("%s\n",s);
                            if(strcmp(s,hmm)<0)
                            {
     
     
                                strcpy(hmm,s);
                            }
     
     
     
                        }
                    }
                    printf("%s\n",hmm);
                }
    return 0;
     
    } 