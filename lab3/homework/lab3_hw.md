---
title: "Lab 3 Homework"
author: "Yuchen Shao"
date: "2023-01-19"
output:
  html_document:
    theme: spacelab
    toc: no
    keep_md: yes
---

## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the tidyverse

```r
#install.packages("tidyverse")
library("tidyverse")
```

## Mammals Sleep
1. For this assignment, we are going to use built-in data on mammal sleep patterns. From which publication are these data taken from? Since the data are built-in you can use the help function in R.

```r
?msleep
```
These data are taken from Proceedings of the National Academy of Sciences.

2. Store these data into a new data frame `sleep`.

```r
sleep <- data.frame(msleep)
```

3. What are the dimensions of this data frame (variables and observations)? How do you know? Please show the *code* that you used to determine this below.  

```r
dim(sleep)
```

```
## [1] 83 11
```

4. Are there any NAs in the data? How did you determine this? Please show your code.  

```r
anyNA(sleep)
```

```
## [1] TRUE
```
Since the result is true, there are some NAS in the data.

5. Show a list of the column names is this data frame.

```r
names(sleep)
```

```
##  [1] "name"         "genus"        "vore"         "order"        "conservation"
##  [6] "sleep_total"  "sleep_rem"    "sleep_cycle"  "awake"        "brainwt"     
## [11] "bodywt"
```

6. How many herbivores are represented in the data?  

```r
table(sleep$vore)
```

```
## 
##   carni   herbi insecti    omni 
##      19      32       5      20
```
There are 32 herbivores represented in the data.

7. We are interested in two groups; small and large mammals. Let's define small as less than or equal to 1kg body weight and large as greater than or equal to 200kg body weight. Make two new dataframes (large and small) based on these parameters.

```r
small <- filter(msleep, bodywt<=1)
large <- filter(msleep, bodywt>=200)
```

8. What is the mean weight for both the small and large mammals?

```r
mean(small$bodywt)
```

```
## [1] 0.2596667
```


```r
mean(large$bodywt)
```

```
## [1] 1747.071
```

9. Using a similar approach as above, do large or small animals sleep longer on average?  

```r
mean(small$sleep_total)
```

```
## [1] 12.65833
```


```r
mean(large$sleep_total)
```

```
## [1] 3.3
```
small animals sleep longer on average

10. Which animal is the sleepiest among the entire dataframe?

```r
max(msleep$sleep_total)
```

```
## [1] 19.9
```


```r
name_1 <- filter(sleep,sleep_total == 19.9)
name_1[1,1]
```

```
## [1] "Little brown bat"
```

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.   
