-module(foldlusingfoldr).
-export([foldl/3]).

foldl(_,Accu,[])->Accu;
foldl(F,Accu,[H|T])->foldl(F,lists:foldr(F,Acc,[H]),T).