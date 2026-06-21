CHD_data <- read.table(file.choose(), header=T, sep=",")
library(ggplot2)
library(dplyr)
attach(CHD_data)
View(CHD_data)

# 2 Sample Hypothesis Testing
# H0: mean maximum heartrate of person with disease = mean maximum heart rate of patients without disease
# H1: mean maximum heartrate of person with disease > mean maximum heart rate of patients without disease
# calculate mean & standard deviation
group_by(CHD_data, target) %>%
summarise(count=n(), mean=mean(max_hr, na.rm=TRUE), sd=sd(max_hr, na.rm=TRUE))
mean(max_hr[target=="1"])
sd(max_hr[target=="1"])
mean(max_hr[target=="0"])
sd(max_hr[target=="0"])
# calculate t0, v & cv
xbar1=158.4667
xbar2=139.1014
s1=19.17428
s2=22.59878
n1=165
n2=138
t0=(xbar1-xbar2-0)/(sqrt((s1^2/n1)+(s2^2/n2)))
t0

v=((s1^2/n1)+(s2^2/n2))^2/((((s1^2/n1)^2)/(n1-1))+(((s2^2/n2)^2)/(n2-1)))
v

alpha=0.05
t.alpha=qt(alpha,floor(v))
# t-test with R
t.test(max_hr[target=="1"], max_hr[target=="0"])

# Correlation Analysis
# grouping data: x-age, y-blood pressure
x <- c(CHD_data$age)
y <- c(CHD_data$resting_bp)

# visualize data
plot(x, y, xlab="age", ylab="blood presssure")
# calculate correlation coefficient
cor(x,y)
# calculate test statistic t
n <- 304
r <- cor(x,y)
r
t <- r/(sqrt((1-(r^2))/(n-2)))
t
# significance test for correlation
# H0: no linear correlation
# H1: linear correlation exists
cor.test(CHD_data$age, CHD_data$resting_bp, method="pearson")


# Regression Analysis
# grouping data: x-age, y-maximum heart Rate
x <- c(CHD_data$age)
y <- c(CHD_data$max_hr)
# find least squares criterion
n <- 304
sum(x)
sum(y)
sum(x^2)
sum(x*y)
b1 <- (sum(x*y)-(sum(x)*sum(y)/n))/(sum(x^2)-((sum(x)^2)/n))
mean(x)
mean(y)
b0 <- mean(y)-(b1*mean(x))
# coefficient of determination R2
yhat <- b0 + (b1*x)
SSR <- sum((yhat-mean(y))^2)
SST <- sum((y-mean(y))^2)
SSE <- SST-SSR
R2 <- SSR/SST
# t-test inference about slope
k <- 1
Se <- sqrt(SSE/(n-k-1))
Sb1 <- Se/(sqrt(sum((x-mean(x))^2)))
# test statistic t
t <- (b1-0)/Sb1
# linear regression
model <- lm(y~x)
model
summary(model)
plot(x, y, xlab="age", ylab="heart rate")
abline(model)


# Chi-Square Test of Independence
# H0: No relationship between variables
# H1: Variables have relationship
# show observed frequencies in table
table(CHD_data$target, CHD_data$sex)
F <- c(24, 72)
M <- c(114, 93)
# find critical value x2
alpha <- 0.05
x2.alpha <- qchisq(alpha, df=1, lower.tail=FALSE)
x2.alpha
# perform chi-square test
tbl = table(CHD_data$target, CHD_data$sex)
chisq.test(tbl, correct=FALSE)


