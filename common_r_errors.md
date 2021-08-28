
# Common Errors in R

Emily Jennings-Dobbs




## could not find function

```r
ymd(10-7-19)
```

```
## Error in ymd(10 - 7 - 19): could not find function "ymd"
```
This error happens most often when the correct packages aren't loaded. The above error would be fixed by including "library(lubridate)" in the line before the code.
If this happens with a function you've defined yourself, make sure the function is defined either in a chunk before it is called or in the same chunk but before the code. 

## Error in if

```r
c <- NA

if(c > 3){
  c =c+1
}
```

```
## Error in if (c > 3) {: missing value where TRUE/FALSE needed
```
This error will appear whenever you try to send a NULL or NA variable into an if statement. Check any previous manipulations of the variable to see if something went wrong. 


## Object not found

```r
temp
```

```
## Error in eval(expr, envir, enclos): object 'temp' not found
```
The variable you have used isn't defined in the code. Check for spelling or capitalization errors and make sure you've defined the variable before the call and not later in the code.

## unexpected ...

```r
c <- 1
if(c>1))
```

```
## Error: <text>:2:8: unexpected ')'
## 1: c <- 1
## 2: if(c>1))
##           ^
```

This one is pretty simple, somewhere in your code is an extra parenthesis.


```r
x 2
```

```
## Error: <text>:1:3: unexpected numeric constant
## 1: x 2
##       ^
```
Usually when this error appears you've forgotten an operator (such as + or =) or you've called a function that requires multiple variables and haven't put a comma between them.

## condition has length > 1

```r
f<-function(t) {
if (t<0){
f<-0
return(f)
}else{
f<-(2*t)/((1+t^2)^2)
return(f)
}
}
f(c(12,13))
```

```
## Warning in if (t < 0) {: the condition has length > 1 and only the first element
## will be used
```

```
## [1] 0.001141498 0.000899654
```
This happens when you pass a variable with multiple elements like a list or vector to a function that expects an input of only one integer or object.  Try using apply() if you need to evaluate the function for multiple values or recheck the declaration of your variables if there is opnly supposed to be one element. 


## $ operator is invalid for atomic vectors

```r
 testlist <- c(1,2,3) 
 testlist$s
```

```
## Error in testlist$s: $ operator is invalid for atomic vectors
```

This happens with lists, the objects in the list are unnamed and therefore it's impossible to  access them with $. Instead use brackets to find the correct subset.



```r
testlist[1]
```

```
## [1] 1
```

## argument is of length zero

```r
 df = read.table(text = '
 A B C D
 1 2 34 4 11
 2 4 34 13 22', header=TRUE)

 for (i in 1:nrow(df))
 if(df[i, "A"] == df[i, "E"]) c=0
```

```
## Error in if (df[i, "A"] == df[i, "E"]) c = 0: argument is of length zero
```
This happens when you call a column name that doesn't exist. This could be fixed by changing "E" in the if staement to a valid column name like "D."

## unimplemented type 'list'

```r
test <- list(1,2,3)
order(test)
```

```
## Error in order(test): unimplemented type 'list' in 'orderVector1'
```
This error happens when you send a list to function that requires a vector. It can be fixed by using as.vector() in some cases, but may require you to redeclare the object as a vector using vector().

## undefined columns selected

```r
df[,5]
```

```
## Error in `[.data.frame`(df, , 5): undefined columns selected
```
This one is almost the same error as our example in "argument is of length zero", we are trying to access a column that doesn't exist. To check what your columns are called check names(), and to check the dimensions use dim().  


## replacement has length zero

```r
x = rep(1, 10)
for (i in 1:10){
   x[i] = x[i]+x[i-1]
}
```

```
## Error in x[i] <- x[i] + x[i - 1]: replacement has length zero
```
This happens when you try to access the zeroth component (x[0]) of a vector which has a value of numeric(0). Check how you are indexing your variables.

## replacement has 10 rows, data has 5

```r
foo <- data.frame(n = c(1:5), d = letters[1:5])
foo$test <- c(1:10)
```

```
## Error in `$<-.data.frame`(`*tmp*`, test, value = 1:10): replacement has 10 rows, data has 5
```

```r
a <- c(30:50)
foo <- c(1:30)
foo[1:10] <- a
```
This error happens when you attempt to store an amount of objects in a space that is either too big or too small to hold them. Check dimensions using dim() and reevaluate what you are trying to do. 


## 'by' must specify a uniquely valid column

```r
df1 = read.table(text = '
 A1 B1 C1 D
 1 2 34 4 11
 2 4 34 13 22', header=TRUE)

merge(x = df, y = df1, by = "C")
```

```
## Error in fix.by(by.y, y): 'by' must specify a uniquely valid column
```
This happens when you try to merge two dataframes by a column that isn't in both dataframes. This would only work if we chose to use by="D" because it is the only column that appears in both dataframes.

## incorrect number of subscripts on matrix

```r
x = rep(1, 10)
for(i in 1:10){x[i,]=5}
```

```
## Error in x[i, ] <- 5: incorrect number of subscripts on matrix
```
This happens when you try to index an object that isn't a matrix as though it was. In other words x is not declared as a matrix and by trying to index it using x[i,] you get an error. If this happens tryusing as.matrix(), or just index x using x[i] instead of x[i,].

## subscript out of bounds

```r
a <- 3
foo <- matrix(NA, nrow = 2, ncol = 2)
foo[a,1] <- 'oops'
```

```
## Error in `[<-`(`*tmp*`, a, 1, value = "oops"): subscript out of bounds
```
This happens when you try to assign an object to an index that doesn't exist. In other words, since there is no third row we can't try to store anything in it.

## cannot open the connection

```r
library(readr)
write_csv(as.data.frame(foo), path = 'the/long/road/to/nowhere.csv')
```

```
## Error: Cannot open file for writing:
## * 'the/long/road/to/nowhere.csv'
```
This one is pretty simple but can be quite annoying if you don't know what it means. Your path just doesn't exist, check for spelling or punctuation errors or look for another path. 

## non-numeric argument to binary operator

```r
a <- '7'
6 + a
```

```
## Error in 6 + a: non-numeric argument to binary operator
```
Also pretty simple, the function used expected a numeric argument to be thrown to it like 7 instead of '7'. The easiest fix is to use as.numeric(), but depending on the situation you may need to re-declare the variable.

## need finite 'xlim' values

```r
x <- rep(NA, 5)  
y <- c(4, 1, 6, 5, 3) 
plot(x, y) 
```

```
## Error in plot.window(...): need finite 'xlim' values
```
This happens when you plot NA or NULL values, check your variables and determine what to do with NA/NULL values.

## unused argument

```r
my_fun1 <- function(x) {         
  x^2
}

my_fun1(x = 1, y = 2)
```

```
## Error in my_fun1(x = 1, y = 2): unused argument (y = 2)
```
This happens when you send a variable to a function that is unneeded and unusable. Above code can be fixed by removing "y=2".


## Tips for Debugging
 
- Check for matching brackets and parenthesis 
- Check for discrepancies in spelling and capitalization
- remove variables with rm() when you're done with them
- If you can't find where your error takes place use traceback()
- Print out your variables to make sure they are of the right type and have the correct dimensions (you can check these using typeof() and dim())
- The internet is your friend, Google your problem and more often than not you'll find someone stuck with the exact same error. Don't forget to check Stack Overflow.
- Check if you've loaded all of the correct packages
- Clean up your environment using the little broomstick button in  the environment window on the upper right of RStudio 
- Try updating your packages
- Restart R
- Unistall and then Reinstall R and/or RStudio
- If all else fails, take a break for a few minutes and come back with fresh eyes. Staring at the same code for long enough will always tire you out and make it harder to find small mistakes.

## References 
Clayvelle, T. (2017). Common errors and debugging R code. Retrieved March 01, 2021, from https://www.tylerclavelle.com/code/2018/debug/

Handling errors &amp; warnings in r: List of typical messages &amp; how to solve. (2021, February 26). Retrieved March 04, 2021, from https://statisticsglobe.com/errors-warnings-r

Huynh, Y. (2019, August 06). R for graduate students. Retrieved March 04, 2021, from https://bookdown.org/yih_huynh/Guide-to-R-Book/trouble.html

Programming, R. (2016, June 06). Common r programming errors faced by beginners. Retrieved March 02, 2021, from https://www.r-bloggers.com/2016/06/common-r-programming-errors-faced-by-beginners/

Silaparasetty, V. (2020, March 05). Common errors in r and debugging techniques. Retrieved March 04, 2021, from https://medium.com/analytics-vidhya/common-errors-in-r-and-debugging-techniques-f11af3f1c7d3
