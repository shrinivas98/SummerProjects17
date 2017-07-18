# Assignment 5

### 1) Currying
#### a) Arithmetic operations
 ##### Addition
- `add(X)` <br/>
   Returns a function that takes another number Y as argument and returns X +  Y.

- `add(X, Y)` <br/>
   Returns X + Y.

  For example : To add 9 and 5
```
> Add9 = higherorder:add(9).
#Fun<higherorder.0.44357095>
> Add9(5).
14
```
OR
```
> higherorder:add(9,5).
14
```

##### Subtraction
- `subtract(X)` <br/>
   Returns a function that takes another number Y as argument and returns X - Y.

- `subtract(X, Y)` <br/>
   Returns X - Y.

  For example : To subtract 6 from 10
```
> Sub10 = higherorder:subtract(10).
#Fun<higherorder.1.44357095>
> Sub10(6).                        
4
```
OR
```
> higherorder:subtract(10,6).
4
```
##### Multiplication
- `multiply(X)` <br/>
   Returns a function that takes another number Y as argument and returns X * Y.

- `multiply(X, Y)` <br/>
   Returns X * Y.

  For example : To multiply 3 and 7
```
> Mul3 = higherorder:multiply(3).
#Fun<higherorder.2.44357095>
> Mul3(7).
21
```
OR
```
> higherorder:multiply(3,7).
21
```
##### Division
- `divide(X)` <br/>
Returns a function that takes another number Y as argument and returns X / Y.

- `divide(X, Y)` <br/>
   Returns X / Y.

  For example : To divide 8 by 5
```
> Div8 = higherorder:divide(8).
#Fun<higherorder.3.44357095>
> Div8(5).
1.6
```
OR
```
> higherorder:divide(8,5).
1.6
```
#### b) Comparison
##### Greater than
- `greaterThanX(Y)` <br/>
Returns a function that takes another number X as argument and returns true if X > Y, else returns false.

- `greaterThanX(X, Y)` <br/>
   Returns true is X > Y, else returns false.

  Example : To check if 3 is greater than 8
```
> Gt8 = higherorder:greaterThanX(8).
#Fun<higherorder.4.44357095>
> Gt8(3).
false
```
OR
```
> higherorder:greaterThanX(3,8).
false
```
##### Lesser than
- `lessThanX(Y)` <br/>
Returns a function that takes another number X as argument and returns true if X < Y, else returns false.

- `lessThanX(X, Y)` <br/>
   Returns true is X < Y, else returns false.

  Example : To check if 4 is less than 7
```
> Lt7 = higherorder:lessThanX(7).
#Fun<higherorder.5.44357095>
> Lt7(4).                        
true
```
OR
```
> higherorder:lessThanX(4,7).
true
```
#### c) Currying in higher order functions
##### fold
- `fold(Function, AccStart)` <br/>
   Returns a function that takes a List as argument and calls Function(Elem, AccIn) on successive elements(Elem) of List, starting with AccIn == AccStart. The function returns the final value of the accumulator. AccStart is returned if the list is empty.  <br/>
**Note**: Function/2 must return a new accumulator, which is passed to the next call.
- `fold(Function, AccStart, List)` <br/>
  Calls Function(Elem, AccIn) on successive elements(Elem) of List, starting with AccIn == AccStart. The function returns the final value of the accumulator. AccStart is returned if the list is empty.  <br/>
**Note**: Function/2 must return a new accumulator, which is passed to the next call.

  Example : To multiply all elements in list [6,4,8,2,5]
```
> MulElem = higherorder:fold(fun(A, B) -> A * B end, 1).
#Fun<higherorder.6.44357095>
> MulElem([6,4,8,2,5]).
1920
```
OR
```
> higherorder:fold(fun(A, B) -> A * B end, 1, [6,4,8,2,5]).
1920
```
##### filter
- `filter(Pred)` <br/>
  Returns a function that takes a List as argument and returns a list of all elements Elem in List for which Pred(Elem) returns true.
- `filter(Pred, List)` <br/>
  Returns a list of all elements Elem in List for which Pred(Elem) returns true.

  Example : To find all numbers in list[32,7,12,14,63,23] which are divisible by 7  
```
> Divisible7 = higherorder:filter(fun(X) -> X rem 7 == 0 end).
#Fun<higherorder.7.44357095>
> Divisible7([32,7,12,14,63,23]).
[7,14,63]
```
OR
```
> higherorder:filter(fun(X) -> X rem 7 == 0 end, [32,7,12,14,63,23]).
[7,14,63]
```
##### map
- `map(Function)` <br/>
   Returns a function that takes a List as argument and returns a list of values of Function(Elem) for each element Elem of List.

- `map(Function, List)` <br/>
   Returns a list of values of Function(Elem) for each element Elem of List.

  Example : To increment all numbers in list[2,3,5,8,13,21] by 3  
```
> Inc3 = higherorder:map(fun(X) -> X + 3 end).
#Fun<higherorder.8.44357095>
> Inc3([2,3,5,8,13,21]).
[5,6,8,11,16,24]
```
OR
```
> higherorder:map(fun(X) -> X + 3 end, [2,3,5,8,13,21]).
[5,6,8,11,16,24]
```
##### all
- `all(Pred)` <br/>
Returns a function that takes a List as argument and returns true if Pred(Elem) returns true for all elements Elem in List, otherwise returns false. <br/>

- `all(Pred, List)` <br/>
Returns true if Pred(Elem) returns true for all elements Elem in List, otherwise returns false.

  Example : Check if all numbers in list[6,2,8,4] are even  
```
> AllEven = higherorder:all(fun(X) -> X rem 2 == 0 end).
#Fun<higherorder.9.44357095>
> AllEven([6,2,8,4]).
true
```
OR
```
> higherorder:all(fun(X) -> X rem 2 == 0 end, [6,2,8,4]).
true
```
##### takewhile
- `takewhile(Pred)` <br/>
Returns a function that takes a List as argument and returns  a list of elements Elem from the List while Pred(Elem) returns true, that is, the function returns the longest prefix of the List for which all elements satisfy the predicate.

- `takewhile(Pred, List)` <br/>
Returns a list of elements Elem from the List while Pred(Elem) returns true, that is, the function returns the longest prefix of the List for which all elements satisfy the predicate.

  Example : Find the longest prefix of the list for which all elements in list[7, 4, 8, 1, 9, 3, 13, 6, 8, 2] is less than 10  
```
> LessThan10 = higherorder:takewhile(fun(X) -> X < 10 end).
#Fun<higherorder.10.44357095>
> LessThan10([7,4,8,1,9,3,13,6,8,2]).
[7,4,8,1,9,3]
```
OR
```
> higherorder:takewhile(fun(X) -> X < 10 end, [7, 4, 8, 1, 9, 3, 13, 6, 8, 2]).
[7,4,8,1,9,3]

```

### 2) Derivative

The derivative of a function f(x) with respect to variable x is defined as:
![f'(x)](https://latex.codecogs.com/gif.latex?%5Cdpi%7B100%7D%20f%27%28x%29%20%3D%20lim_%7Bh%20-%3E%200%7D%5Cfrac%7Bf%28x&plus;h%29%20-%20f%28x%29%7D%7Bh%7D)
where f must be a continuous function.

`derive(Function, H)` <br/>
Returns a new function that takes X as argument and represents the derivative of Function (must be continuous) for a given  value of H, where H is the limiting value.


Example:
![f(x)](https://latex.codecogs.com/gif.latex?%5Cdpi%7B100%7D%20f%28x%29%20%3D%204x%5E%7B3%7D-3x&plus;1)
![f'(x)](https://latex.codecogs.com/gif.latex?%5Cdpi%7B100%7D%20f%27%28x%29%20%3D%2012x%5E%7B2%7D-3)
![f'(4)](https://latex.codecogs.com/gif.latex?%5Cdpi%7B100%7D%20f%27%284%29%20%3D%20189)
![f''(x)](https://latex.codecogs.com/gif.latex?%5Cdpi%7B100%7D%20f%27%27%28x%29%20%3D%2024x)
![f''(7)](https://latex.codecogs.com/gif.latex?%5Cdpi%7B100%7D%20f%27%27%287%29%20%3D%20168)
```
> F = fun(X) -> 4*X*X*X - 3*X + 5 end.
#Fun<erl_eval.6.118419387>
> DF = higherorder:derive(F, 0.001).
#Fun<higherorder.11.44357095>
> DF(4).
189.04800400008526

> DDF = higherorder:derive(DF, 0.001).
#Fun<higherorder.11.44357095>
> DDF(7).
168.0239997767785
```

### 3) Integral

Simpson's rule is a method for numeric integration:
![Simpson's rule](https://latex.codecogs.com/gif.latex?%5Cint_%7Ba%7D%5E%7Bb%7Df%20%3D%20%5Cfrac%7Bh%7D%7B3%7D%28y_%7B0%7D%20&plus;%204y_%7B1%7D&plus;2y_%7B2%7D&plus;4y_%7B3%7D&plus;2y_%7B4%7D&plus;...&plus;2y_%7Bn-2%7D&plus;4y_%7Bn-1%7D&plus;y_%7Bn%7D%29)
where ![h](https://latex.codecogs.com/gif.latex?%5Cdpi%7B80%7D%20h%20%3D%20%5Cfrac%7Ba%20-%20b%7D%7Bn%7D)  for a given even positive integer n and ![yk](https://latex.codecogs.com/gif.latex?%5Cdpi%7B80%7D%20y_%7Bk%7D%20%3D%20f%28a%20&plus;%20k%20*%20h%29).

`integral(A, B, N, Function)` <br/>
Performs Simpson's rule to return the value of integral of Function from limits A to B.

For example:
##### Single Integral
![ex1](https://latex.codecogs.com/gif.latex?%5Cdpi%7B100%7D%20%5Cint_%7B1%7D%5E%7B2%7Dx%5E%7B2%7D%20&plus;%20x%20&plus;%201%20%3D%20%5Cfrac%7B29%7D%7B6%7D) <br/>
would be written in erlang as follows (with n = 20)
```
> higherorder:integral(1,2,20,fun(X) -> X*X + X + 1 end).
4.833333333333333
```
##### Double Integral

![](https://latex.codecogs.com/gif.latex?%5Cdpi%7B100%7D%20%5Cint_%7B3%7D%5E%7B4%7D%5Cint_%7B1%7D%5E%7B2%7D%20%28x%5E%7B2%7D%20&plus;%20y%5E%7B2%7D%29%20dxdy%20%3D%20%5Cfrac%7B44%7D%7B3%7D) <br/>
would be written in erlang as follows (with n = 20)
```
> higherorder:integral(3,4,20, fun(X)-> higherorder:integral(1,2,20, fun(Y) -> X*X + Y*Y end) end).
14.66666666666667
```

### 4) foldl using foldr

`foldl(Function, AccStart, List)` <br/>
Calls Function(Elem, AccIn) on successive elements(Elem) of List from left to right, starting with AccIn == AccStart. The function returns the final value of the accumulator. AccStart is returned if the list is empty. </br>
**Note**: Function/2 must return a new accumulator, which is passed to the next call.

Example: To add all elements of list[7, 2, 17, 12, 9, 13]
```
> higherorder:foldl(fun(A,B) -> A + B end, 0, [7,2,17,12,9,13]).
60
```
