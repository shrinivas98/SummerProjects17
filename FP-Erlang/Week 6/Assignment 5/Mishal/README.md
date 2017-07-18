# ASSIGNMENT-5

### Examples for classic higher order functions in curried functions :-

1) Using **foldl** curried function to find product of elements of List.
```
> Fa=assignment5:three_a(fun(X,Prod) -> X*Prod end,1).
#Fun<assignment5.6.28601752>
> Fa([1,2,3,4]).
24
```
2) Using **filter** curried function to generate new list of elements greater then 2.
```
> Fb=assignment5:three_b(fun(X) -> X>2 end).
#Fun<assignment5.7.28601752>
> Fb([1,2,3,4,6]).
[3,4,6]
```
3) Using **map** curried function to find if elements of list is equal to 2.
```
> Fc=assignment5:three_c(fun(X) -> X==2 end).
#Fun<assignment5.8.28601752>
> Fc([1,2,3,4,5]).
[false,true,false,false,false]
```
4) Using **foldl** curried function to generate new list of elements not equal to 5.
```
> Fd=assignment5:three_a(fun(A,Newlist) -> case A/=5 of true -> Newlist++[A];false -> Newlist end end,[]).
#Fun<assignment5.6.28601752>
> Fd([1,2,3,4,5,5,6,5]).
[1,2,3,4,6]
```
5) Using **map** curried function to generate new list with the cube of elements of the given list.
```
> Fe=assignment5:three_c(fun(X) -> X*X*X end).                                
#Fun<assignment5.8.28601752>     
> Fe([1,2,3,4,5,6]).
[1,8,27,64,125,216]
```

### Implementing ```foldl``` using ```foldr```
- Two times ```lists:foldr``` is used, first the desired output is done, afterwhich ```lists:foldr``` is used to reverse the obtained List.
```
> assignment5:foldl(fun(A,Newlist) -> case A>2 of true -> Newlist++[A];false -> Newlist end end,[],[1,2,3,4,5,6]).
[3,4,5,6]
```

### Universal Nature of Foldr
- The universal property states that for finite lists the function fold is not just a solution to its defining equations, but in fact the unique solution.
its defining equations, but in fact the unique solution.
