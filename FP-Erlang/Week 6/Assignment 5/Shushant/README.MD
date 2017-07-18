<h2>ASSIGNMENT 5</h2><br><br>
1.Currying in Erlang<br>
   i)add(X) <br>
  ii)sub(X)<br>
 iii)mult(X)<br>
  iv)divi(X)<br>
   v)greaterThanX(X)<br>
  vi)lessThanX(X)<br>
2. Derivative of function<br>
3. Integral of function by Simpson's rule<br>
4. Implementing foldl using foldr<br>
   Basically we pass only one element(i.e. Head) to foldr<br>
   and foldr returns the accumulated value <br>
5.foldr can be implemented by foldl using the same above technique or <br>
  by processing on reverse list<br>
  The Erlang documentation points out that lists:foldl/3 is generally preferable over lists:foldr/3<br>
  because lists:foldl/3 is tail recursive, where lists:foldr/3 is not.<br>
   

  