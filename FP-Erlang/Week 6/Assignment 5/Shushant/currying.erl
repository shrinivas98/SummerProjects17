-module(currying).
-export([add/1,sub/1,mult/1,divi/1,greaterThanX/1,lessThanX/1]).
-export([add/2,sub/2,mult/2,divi/2,greaterThanX/2,lessThanX/2]).


add(X)-> fun(Y)->X +Y end.
add(X,Y)->X+Y.

sub(X)-> fun(Y)->X -Y end.
sub(X,Y)->X-Y.

mult(X)-> fun(Y)->X *Y end.
mult(X,Y)->X*Y.

divi(X)-> fun(Y)->X /Y end.
divi(X,Y)->X/Y.

greaterThanX(X)->fun(Y)->
if
X<Y->true; 
true->false
end 
end.
greaterThanX(X,Y)->if
X<Y->true; 
true->false
end.


lessThanX(X)->fun(Y)->
if 
X>Y->true; 
true->false 
end
end.
lessThanX(X,Y)->
if 
X>Y->true; 
true->false 
end.


%% Examples of curried functions in the classic higher order functions like map, filter and fold %%
%% Even = fun(X) -> (X rem 2) =:= 0 end. 
%% Even(8). 
%% Even(7). 
%% lists:map(Even, [1,2,3,4,5,6,8]). 
%% lists:filter(Even, [1,2,3,4,5,6,8]). 
%% lists:foldl(Even, 0, [1,2,3,4,5,6,8]). 
%% lists:takewhile(Even, [1,2,3,4,5,6,8]). 
%% lists:dropwhile(Even, [1,2,3,4,5,6,8]). 

