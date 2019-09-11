x<- c(1,3,2)
x
y = c(5,6,3)
y
#ls and objects perform the same task
ls()
objects()

# line 10 removes the specified function(s)
rm(x,y)
objects()

# Line 14 deletes all functions in the script
rm(list = ls())

# matrix input
?matrix
x = matrix(data = c(1,2,3,4), nrow = 2, ncol = 2)
x

# professional/shorter way of inputing the matrix function
x<- matrix(c(1,2,3,4),2,2)
x

#by default, matrix is populated by col, but this can be altered by adding the arg below
matrix(c(1,2,3,4),2,2,byrow = TRUE)
m = sqrt(x)
m
round(m, digits = 2)
x^2

#the rnorm function generates a vector of random normal (rnorm) variables
x<- rnorm(50)

# line 36 uses the correlation function (cor) to compute the covariance of the rnorms
y = x+rnorm(50,mean=50, sd = .1)
cor(x,y)

#the set.seed function (it takes an arbitrary integer) can be used to reproduce the exact same set of numbers
set.seed(1303)
rnorm(50)

# use of mean and variance
set.seed(3)
y = rnorm(100)
mean(y)
var(y)
sqrt(var(y))
sd(y)

### Graphics
## plot() is the primary way to plot data in R
x = rnorm(100)
y = rnorm(100)
plot(x,y)
plot(x,y,xlab = "this is the x-axis", ylab = "this is the y-axis", main ="Plot of X vs Y")

# pdf() for creating pdf files and jpeg() for creating jpeg files
pdf("Figure1.1.pdf")
plot(x,y, type = "h", col="Red")
dev.off()
# the function dev.off() tells R that we are done with the plot.

# seq() can be used to create a sequence of numbers
seq(0,1,length = 7)
x = seq(1,10)
x
#alternatively
x = 1:10
x
x<-seq(-pi, pi, length = 50)
x

#the contour() produces contour plot for representing 3d data e.g topographical maps
#further study on this in your spare time#
?contour
y = x
f = outer(x,y, function(x,y)cos(y)/(1+x^2))
contour(x,y,f)
contour(x,y,f,nlevels = 45, add = T)
fa=(f-t(f))/2
contour(x,y,fa,nlevels = 15)

# the image() function works the same way as contour() but even better#
jpeg("heat map.jpeg")
image(x,y,f)
dev.off()

# another way to produce a 3d plot is the use of persp() function
?persp
# example 1 from the "help document file"
x <- seq(-10, 10, length= 30)
y <- x
f <- function(x, y) { r <- sqrt(x^2+y^2); 10 * sin(r)/r }
z <- outer(x, y, f)
z[is.na(z)] <- 1
op <- par(bg = "white")
persp(x, y, z, theta = 30, phi = 30, expand = 0.5, col = "lightblue")
persp(x, y, z, theta = 30, phi = 30, expand = 0.5, col = "lightblue",
      ltheta = 120, shade = 0.75, ticktype = "detailed",
      xlab = "X", ylab = "Y", zlab = "Sinc( r )"
) -> res
round(res, 3)

#example of persp() from ISLR
image(x,y,fa)
persp(x,y,fa)

#theta and phi control the viewing angles
persp(x,y,fa,theta = 30)
persp(x,y,fa,theta = 30,phi = 20)
persp(x,y,fa,theta = 30,phi = 70)
persp(x,y,fa,theta = 30,phi = 40)


# Indexing data: Suitable for examining part of a set of data.
A<- matrix(seq(1,16),4,4)
A
#calling out the element on the 2nd row,3rd column
A[2,3]
# row,column
A[c(1,3),c(2,4)]
A[1:3,2:4]
#to highlight the elements in the first two rows
A[1:2,]
# alternatively
A[seq(1,2),]

# to select the first two columns
A[,1:2]

# note that r treats a single row or column of a matrix as a vector
A[1,]

# negative sign is used to eliminate some vectors from the matrix
A[-c(1,3),]
A[-c(1,3),-c(1,3,4)]

# the dim() function outputs the no. of rows and cols of a given matrix
dim(A)


# Loading Data
# read.table(): for importing data(), write.table(): for exporting data
# fix() for viewing the dataset in spreadsheet format

Auto = read.table("Auto.data")
fix(Auto)
# tells R that the first row contains the header
Auto = read.table("Auto.data", header = T, na.strings = "?")
fix(Auto)

# loading Excel file saved with .csv

Auto = read.csv("Auto.csv", header = T, na.strings = "?")
fix(Auto)
dim(Auto)
Auto[1:4,]

# omitting the rows that has missing observation(s)
Auto = na.omit(Auto)
dim(Auto)

# to check the variable names
names(Auto)
fix(Auto)

# Additional Graphical and Numerical Summaries
plot(Auto$cylinders, Auto$mpg)

#alternatively
attach(Auto)
plot(cylinders, mpg)

# to convert quantitative variable to qualitative variable
cylinders = as.factor(cylinders)
plot(cylinders,mpg)
plot(cylinders,mpg, col = "red")
plot(cylinders,mpg, col = "red", varwidth = T)
plot(cylinders,mpg, col = "red", varwidth = T, xlab = "cylinders", ylab = "mpg")

# Plotting of Histogram
# col = red is same as col = 2
hist(mpg)
hist(mpg, col = 2)
hist(mpg, col = 2, breaks = 15)

# pairs() create a scatterplot for every pair of variables in a given data set
pairs(~cylinders+mpg)

#identify(): For plotting and printing the variable of interest
plot(horsepower,mpg)
identify(horsepower, mpg, name)

attach(Auto)
summary(Auto)
summary(horsepower)
summary(cylinders)
summary(mpg)
Auto
fix(Auto)

dt(0.05,94)
?dt
