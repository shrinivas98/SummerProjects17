############################################## ASSIGNMENT 5 ######################################################
############################################## Ashwin Joisa ######################################################


################################################################################################ Question 1

PART 1

Currying is the partial application of a function. The 4 functions add, subtract, multiply, and divide
are curried. They accept one parameter and return a function which when given the another parameter
performs the operation between the 2 parameters. The 2 parameter forms of these are implemented using the curried forms.

PART 2

The curried forms of greater than X, and lesser than X are implemented.

PART 3

Higher Order Functions are curried. 5 examples being map, all, any, dropwhile, and takewhile.
The definitions of the above are commented in the source code.

################################################################################################ Question 2

derive(F, H) - 	returns a new function that takes X as input, 
				and represents the derivate of F given a certain value for H.

################################################################################################ Question 3

integral(A, B, N, F) - evaluates the integral of F over [A, B], with N partitions using Simpson's rule.

################################################################################################ Question 4

foldl is implemented using foldr.