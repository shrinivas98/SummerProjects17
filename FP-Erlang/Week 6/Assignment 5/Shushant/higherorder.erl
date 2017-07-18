-module(higherorder).
-export([derive/2,integral/4]).


%%Ques2%%
derive( F, Dx ) ->
        fun( X ) ->
                ( F( X + Dx ) - F ( X ) ) / Dx
        end.


%%Ques3%%
integral(A,B,N,F)->integral(A,(B-A)/(3*N),N,F,0,0).
integral(A,H,N,F,I,Sum) when I==0 -> integral(A,H,N,F,I+1,Sum+F(A));
integral(A,H,N,F,I,Sum) when I==N -> integral(A,H,N,F,I+1,Sum+F(A+N*H));
integral(A,H,N,F,I,Sum) when ((I rem 2)==1) -> integral(A,H,N,F,I+1,Sum + (4*F(A + I*H))).
integral(A,H,N,F,I,Sum) when ((I rem 2)==0) -> integral(A,H,N,F,I+1,Sum + (2*F(A + I*H))).

