---
title: "Lab 2 Homework"
author: "Yuchen Shao"
date: "2023-01-16"
output:
  html_document:
    theme: spacelab
    toc: no
    keep_md: yes
---

## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

1. What is a vector in R?  

Vectors are a basic way of organizing data and include a list of data that are the same class

2. What is a data matrix in R?  

A data matrix is a series of stacked vectors

3. Below are data collected by three scientists (Jill, Steve, Susan in order) measuring temperatures of eight hot springs. Run this code chunk to create the vectors.  

```r
spring_1 <- c(36.25, 35.40, 35.30)
spring_2 <- c(35.15, 35.35, 33.35)
spring_3 <- c(30.70, 29.65, 29.20)
spring_4 <- c(39.70, 40.05, 38.65)
spring_5 <- c(31.85, 31.40, 29.30)
spring_6 <- c(30.20, 30.65, 29.75)
spring_7 <- c(32.90, 32.50, 32.80)
spring_8 <- c(36.80, 36.45, 33.15)
```

4. Build a data matrix that has the springs as rows and the columns as scientists.  


```r
office <- c(spring_1,spring_2,spring_3,spring_4,spring_5,spring_6,spring_7,spring_8)
Date_matrix <- matrix(office, nrow = 8, byrow = T)
scientists <- c("Jill", "Steve", "Susan")
springs <- c("spring_1","spring_2","spring_3","spring_4","spring_5","spring_6","spring_7","spring_8")
colnames(Date_matrix) <- scientists
rownames(Date_matrix) <- springs
Date_matrix
```

```
##           Jill Steve Susan
## spring_1 36.25 35.40 35.30
## spring_2 35.15 35.35 33.35
## spring_3 30.70 29.65 29.20
## spring_4 39.70 40.05 38.65
## spring_5 31.85 31.40 29.30
## spring_6 30.20 30.65 29.75
## spring_7 32.90 32.50 32.80
## spring_8 36.80 36.45 33.15
```

5. The names of the springs are 1.Bluebell Spring, 2.Opal Spring, 3.Riverside Spring, 4.Too Hot Spring, 5.Mystery Spring, 6.Emerald Spring, 7.Black Spring, 8.Pearl Spring. Name the rows and columns in the data matrix. Start by making two new vectors with the names, then use `colnames()` and `rownames()` to name the columns and rows.


```r
springs_level <- c("Bluebell Spring","Opal Spring","Riverside Spring","Too Hot Spring","Mystery Spring","Emerald Spring","Black Spring","Pearl Spring")
rownames(Date_matrix) <- springs_level
Date_matrix
```

```
##                   Jill Steve Susan
## Bluebell Spring  36.25 35.40 35.30
## Opal Spring      35.15 35.35 33.35
## Riverside Spring 30.70 29.65 29.20
## Too Hot Spring   39.70 40.05 38.65
## Mystery Spring   31.85 31.40 29.30
## Emerald Spring   30.20 30.65 29.75
## Black Spring     32.90 32.50 32.80
## Pearl Spring     36.80 36.45 33.15
```



6. Calculate the mean temperature of all eight springs.

```r
mean_tem <- rowMeans(Date_matrix)
mean_tem
```

```
##  Bluebell Spring      Opal Spring Riverside Spring   Too Hot Spring 
##         35.65000         34.61667         29.85000         39.46667 
##   Mystery Spring   Emerald Spring     Black Spring     Pearl Spring 
##         30.85000         30.20000         32.73333         35.46667
```

7. Add this as a new column in the data matrix.  


```r
Date_matrix_1 <- cbind(Date_matrix,mean_tem)
Date_matrix_1
```

```
##                   Jill Steve Susan mean_tem
## Bluebell Spring  36.25 35.40 35.30 35.65000
## Opal Spring      35.15 35.35 33.35 34.61667
## Riverside Spring 30.70 29.65 29.20 29.85000
## Too Hot Spring   39.70 40.05 38.65 39.46667
## Mystery Spring   31.85 31.40 29.30 30.85000
## Emerald Spring   30.20 30.65 29.75 30.20000
## Black Spring     32.90 32.50 32.80 32.73333
## Pearl Spring     36.80 36.45 33.15 35.46667
```

8. Show Susan's value for Opal Spring only.


```r
Date_matrix_1[2,3]
```

```
## [1] 33.35
```

9. Calculate the mean for Jill's column only.  


```r
mean_Jill <- Date_matrix_1[,1]
mean_Jill_number <- mean(mean_Jill)
mean_Jill_number
```

```
## [1] 34.19375
```

10. Use the data matrix to perform one calculation or operation of your interest.


```r
mean_tem_1 <- colMeans(Date_matrix_1)
Date_matrix_2 <- rbind(Date_matrix_1,mean_tem_1)
Date_matrix_2
```

```
##                      Jill    Steve   Susan mean_tem
## Bluebell Spring  36.25000 35.40000 35.3000 35.65000
## Opal Spring      35.15000 35.35000 33.3500 34.61667
## Riverside Spring 30.70000 29.65000 29.2000 29.85000
## Too Hot Spring   39.70000 40.05000 38.6500 39.46667
## Mystery Spring   31.85000 31.40000 29.3000 30.85000
## Emerald Spring   30.20000 30.65000 29.7500 30.20000
## Black Spring     32.90000 32.50000 32.8000 32.73333
## Pearl Spring     36.80000 36.45000 33.1500 35.46667
## mean_tem_1       34.19375 33.93125 32.6875 33.60417
```

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.  
