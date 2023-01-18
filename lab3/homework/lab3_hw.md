---
title: "Lab 3 Homework"
author: "Yuchen Shao"
date: "2023-01-18"
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
library(tidyverse)
install.packages("tidyverse")
```

## Mammals Sleep
1. For this assignment, we are going to use built-in data on mammal sleep patterns. From which publication are these data taken from? Since the data are built-in you can use the help function in R.

These date are take from the publication called Science

```r
msleep <- readr::read_csv("data/mammals_sleep_allison_cicchetti_1976.csv")
```

```
## Rows: 62 Columns: 11
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (1): species
## dbl (10): body weight in kg, brain weight in g, slow wave ("nondreaming") sl...
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```r
??msleep
```

```
## 打开httpd帮助服务器… 好了
```

2. Store these data into a new data frame `sleep`.

```r
sleep <- data.frame(msleep)
sleep
```

```
##                      species body.weight.in.kg brain.weight.in.g
## 1           African elephant          6654.000           5712.00
## 2  African giant pouched rat             1.000              6.60
## 3                 Arctic Fox             3.385             44.50
## 4     Arctic ground squirrel             0.920              5.70
## 5             Asian elephant          2547.000           4603.00
## 6                     Baboon            10.550            179.50
## 7              Big brown bat             0.023              0.30
## 8            Brazilian tapir           160.000            169.00
## 9                        Cat             3.300             25.60
## 10                Chimpanzee            52.160            440.00
## 11                Chinchilla             0.425              6.40
## 12                       Cow           465.000            423.00
## 13           Desert hedgehog             0.550              2.40
## 14                    Donkey           187.100            419.00
## 15     Eastern American mole             0.075              1.20
## 16                   Echidna             3.000             25.00
## 17         European hedgehog             0.785              3.50
## 18                    Galago             0.200              5.00
## 19                     Genet             1.410             17.50
## 20           Giant armadillo            60.000             81.00
## 21                   Giraffe           529.000            680.00
## 22                      Goat            27.660            115.00
## 23            Golden hamster             0.120              1.00
## 24                   Gorilla           207.000            406.00
## 25                 Gray seal            85.000            325.00
## 26                 Gray wolf            36.330            119.50
## 27           Ground squirrel             0.101              4.00
## 28                Guinea pig             1.040              5.50
## 29                     Horse           521.000            655.00
## 30                    Jaguar           100.000            157.00
## 31                  Kangaroo            35.000             56.00
## 32 Lesser short-tailed shrew             0.005              0.14
## 33          Little brown bat             0.010              0.25
## 34                       Man            62.000           1320.00
## 35                  Mole rat             0.122              3.00
## 36           Mountain beaver             1.350              8.10
## 37                     Mouse             0.023              0.40
## 38                Musk shrew             0.048              0.33
## 39       N. American opossum             1.700              6.30
## 40     Nine-banded armadillo             3.500             10.80
## 41                     Okapi           250.000            490.00
## 42                Owl monkey             0.480             15.50
## 43              Patas monkey            10.000            115.00
## 44                Phanlanger             1.620             11.40
## 45                       Pig           192.000            180.00
## 46                    Rabbit             2.500             12.10
## 47                   Raccoon             4.288             39.20
## 48                       Rat             0.280              1.90
## 49                   Red fox             4.235             50.40
## 50             Rhesus monkey             6.800            179.00
## 51    Rock hyrax (Hetero. b)             0.750             12.30
## 52 Rock hyrax (Procavia hab)             3.600             21.00
## 53                  Roe deer            14.830             98.20
## 54                     Sheep            55.500            175.00
## 55                Slow loris             1.400             12.50
## 56           Star nosed mole             0.060              1.00
## 57                    Tenrec             0.900              2.60
## 58                Tree hyrax             2.000             12.30
## 59                Tree shrew             0.104              2.50
## 60                    Vervet             4.190             58.00
## 61             Water opossum             3.500              3.90
## 62     Yellow-bellied marmot             4.050             17.00
##    slow.wave...nondreaming...sleep..hrs.day.
## 1                                     -999.0
## 2                                        6.3
## 3                                     -999.0
## 4                                     -999.0
## 5                                        2.1
## 6                                        9.1
## 7                                       15.8
## 8                                        5.2
## 9                                       10.9
## 10                                       8.3
## 11                                      11.0
## 12                                       3.2
## 13                                       7.6
## 14                                    -999.0
## 15                                       6.3
## 16                                       8.6
## 17                                       6.6
## 18                                       9.5
## 19                                       4.8
## 20                                      12.0
## 21                                    -999.0
## 22                                       3.3
## 23                                      11.0
## 24                                    -999.0
## 25                                       4.7
## 26                                    -999.0
## 27                                      10.4
## 28                                       7.4
## 29                                       2.1
## 30                                    -999.0
## 31                                    -999.0
## 32                                       7.7
## 33                                      17.9
## 34                                       6.1
## 35                                       8.2
## 36                                       8.4
## 37                                      11.9
## 38                                      10.8
## 39                                      13.8
## 40                                      14.3
## 41                                    -999.0
## 42                                      15.2
## 43                                      10.0
## 44                                      11.9
## 45                                       6.5
## 46                                       7.5
## 47                                    -999.0
## 48                                      10.6
## 49                                       7.4
## 50                                       8.4
## 51                                       5.7
## 52                                       4.9
## 53                                    -999.0
## 54                                       3.2
## 55                                    -999.0
## 56                                       8.1
## 57                                      11.0
## 58                                       4.9
## 59                                      13.2
## 60                                       9.7
## 61                                      12.8
## 62                                    -999.0
##    paradoxical...dreaming...sleep..hrs.day.
## 1                                    -999.0
## 2                                       2.0
## 3                                    -999.0
## 4                                    -999.0
## 5                                       1.8
## 6                                       0.7
## 7                                       3.9
## 8                                       1.0
## 9                                       3.6
## 10                                      1.4
## 11                                      1.5
## 12                                      0.7
## 13                                      2.7
## 14                                   -999.0
## 15                                      2.1
## 16                                      0.0
## 17                                      4.1
## 18                                      1.2
## 19                                      1.3
## 20                                      6.1
## 21                                      0.3
## 22                                      0.5
## 23                                      3.4
## 24                                   -999.0
## 25                                      1.5
## 26                                   -999.0
## 27                                      3.4
## 28                                      0.8
## 29                                      0.8
## 30                                   -999.0
## 31                                   -999.0
## 32                                      1.4
## 33                                      2.0
## 34                                      1.9
## 35                                      2.4
## 36                                      2.8
## 37                                      1.3
## 38                                      2.0
## 39                                      5.6
## 40                                      3.1
## 41                                      1.0
## 42                                      1.8
## 43                                      0.9
## 44                                      1.8
## 45                                      1.9
## 46                                      0.9
## 47                                   -999.0
## 48                                      2.6
## 49                                      2.4
## 50                                      1.2
## 51                                      0.9
## 52                                      0.5
## 53                                   -999.0
## 54                                      0.6
## 55                                   -999.0
## 56                                      2.2
## 57                                      2.3
## 58                                      0.5
## 59                                      2.6
## 60                                      0.6
## 61                                      6.6
## 62                                   -999.0
##    total.sleep..hrs.day....sum.of.slow.wave.and.paradoxical.sleep.
## 1                                                              3.3
## 2                                                              8.3
## 3                                                             12.5
## 4                                                             16.5
## 5                                                              3.9
## 6                                                              9.8
## 7                                                             19.7
## 8                                                              6.2
## 9                                                             14.5
## 10                                                             9.7
## 11                                                            12.5
## 12                                                             3.9
## 13                                                            10.3
## 14                                                             3.1
## 15                                                             8.4
## 16                                                             8.6
## 17                                                            10.7
## 18                                                            10.7
## 19                                                             6.1
## 20                                                            18.1
## 21                                                          -999.0
## 22                                                             3.8
## 23                                                            14.4
## 24                                                            12.0
## 25                                                             6.2
## 26                                                            13.0
## 27                                                            13.8
## 28                                                             8.2
## 29                                                             2.9
## 30                                                            10.8
## 31                                                          -999.0
## 32                                                             9.1
## 33                                                            19.9
## 34                                                             8.0
## 35                                                            10.6
## 36                                                            11.2
## 37                                                            13.2
## 38                                                            12.8
## 39                                                            19.4
## 40                                                            17.4
## 41                                                          -999.0
## 42                                                            17.0
## 43                                                            10.9
## 44                                                            13.7
## 45                                                             8.4
## 46                                                             8.4
## 47                                                            12.5
## 48                                                            13.2
## 49                                                             9.8
## 50                                                             9.6
## 51                                                             6.6
## 52                                                             5.4
## 53                                                             2.6
## 54                                                             3.8
## 55                                                            11.0
## 56                                                            10.3
## 57                                                            13.3
## 58                                                             5.4
## 59                                                            15.8
## 60                                                            10.3
## 61                                                            19.4
## 62                                                          -999.0
##    maximum.life.span..years. gestation.time..days. predation.index..1.5.
## 1                       38.6                 645.0                     3
## 2                        4.5                  42.0                     3
## 3                       14.0                  60.0                     1
## 4                     -999.0                  25.0                     5
## 5                       69.0                 624.0                     3
## 6                       27.0                 180.0                     4
## 7                       19.0                  35.0                     1
## 8                       30.4                 392.0                     4
## 9                       28.0                  63.0                     1
## 10                      50.0                 230.0                     1
## 11                       7.0                 112.0                     5
## 12                      30.0                 281.0                     5
## 13                    -999.0                -999.0                     2
## 14                      40.0                 365.0                     5
## 15                       3.5                  42.0                     1
## 16                      50.0                  28.0                     2
## 17                       6.0                  42.0                     2
## 18                      10.4                 120.0                     2
## 19                      34.0                -999.0                     1
## 20                       7.0                -999.0                     1
## 21                      28.0                 400.0                     5
## 22                      20.0                 148.0                     5
## 23                       3.9                  16.0                     3
## 24                      39.3                 252.0                     1
## 25                      41.0                 310.0                     1
## 26                      16.2                  63.0                     1
## 27                       9.0                  28.0                     5
## 28                       7.6                  68.0                     5
## 29                      46.0                 336.0                     5
## 30                      22.4                 100.0                     1
## 31                      16.3                  33.0                     3
## 32                       2.6                  21.5                     5
## 33                      24.0                  50.0                     1
## 34                     100.0                 267.0                     1
## 35                    -999.0                  30.0                     2
## 36                    -999.0                  45.0                     3
## 37                       3.2                  19.0                     4
## 38                       2.0                  30.0                     4
## 39                       5.0                  12.0                     2
## 40                       6.5                 120.0                     2
## 41                      23.6                 440.0                     5
## 42                      12.0                 140.0                     2
## 43                      20.2                 170.0                     4
## 44                      13.0                  17.0                     2
## 45                      27.0                 115.0                     4
## 46                      18.0                  31.0                     5
## 47                      13.7                  63.0                     2
## 48                       4.7                  21.0                     3
## 49                       9.8                  52.0                     1
## 50                      29.0                 164.0                     2
## 51                       7.0                 225.0                     2
## 52                       6.0                 225.0                     3
## 53                      17.0                 150.0                     5
## 54                      20.0                 151.0                     5
## 55                      12.7                  90.0                     2
## 56                       3.5                -999.0                     3
## 57                       4.5                  60.0                     2
## 58                       7.5                 200.0                     3
## 59                       2.3                  46.0                     3
## 60                      24.0                 210.0                     4
## 61                       3.0                  14.0                     2
## 62                      13.0                  38.0                     3
##    sleep.exposure.index..1.5. overall.danger.index..1.5.
## 1                           5                          3
## 2                           1                          3
## 3                           1                          1
## 4                           2                          3
## 5                           5                          4
## 6                           4                          4
## 7                           1                          1
## 8                           5                          4
## 9                           2                          1
## 10                          1                          1
## 11                          4                          4
## 12                          5                          5
## 13                          1                          2
## 14                          5                          5
## 15                          1                          1
## 16                          2                          2
## 17                          2                          2
## 18                          2                          2
## 19                          2                          1
## 20                          1                          1
## 21                          5                          5
## 22                          5                          5
## 23                          1                          2
## 24                          4                          1
## 25                          3                          1
## 26                          1                          1
## 27                          1                          3
## 28                          3                          4
## 29                          5                          5
## 30                          1                          1
## 31                          5                          4
## 32                          2                          4
## 33                          1                          1
## 34                          1                          1
## 35                          1                          1
## 36                          1                          3
## 37                          1                          3
## 38                          1                          3
## 39                          1                          1
## 40                          1                          1
## 41                          5                          5
## 42                          2                          2
## 43                          4                          4
## 44                          1                          2
## 45                          4                          4
## 46                          5                          5
## 47                          2                          2
## 48                          1                          3
## 49                          1                          1
## 50                          3                          2
## 51                          2                          2
## 52                          2                          3
## 53                          5                          5
## 54                          5                          5
## 55                          2                          2
## 56                          1                          2
## 57                          1                          2
## 58                          1                          3
## 59                          2                          2
## 60                          3                          4
## 61                          1                          1
## 62                          1                          1
```

3. What are the dimensions of this data frame (variables and observations)? How do you know? Please show the *code* that you used to determine this below.  

```r
dim(sleep)
```

```
## [1] 62 11
```

4. Are there any NAs in the data? How did you determine this? Please show your code.  

```r
sum(is.na(sleep))
```

```
## [1] 0
```
There are no NAs in the date

5. Show a list of the column names is this data frame.

```r
names(sleep)
```

```
##  [1] "species"                                                        
##  [2] "body.weight.in.kg"                                              
##  [3] "brain.weight.in.g"                                              
##  [4] "slow.wave...nondreaming...sleep..hrs.day."                      
##  [5] "paradoxical...dreaming...sleep..hrs.day."                       
##  [6] "total.sleep..hrs.day....sum.of.slow.wave.and.paradoxical.sleep."
##  [7] "maximum.life.span..years."                                      
##  [8] "gestation.time..days."                                          
##  [9] "predation.index..1.5."                                          
## [10] "sleep.exposure.index..1.5."                                     
## [11] "overall.danger.index..1.5."
```

6. How many herbivores are represented in the data?  


7. We are interested in two groups; small and large mammals. Let's define small as less than or equal to 1kg body weight and large as greater than or equal to 200kg body weight. Make two new dataframes (large and small) based on these parameters.


8. What is the mean weight for both the small and large mammals?




9. Using a similar approach as above, do large or small animals sleep longer on average?  




10. Which animal is the sleepiest among the entire dataframe?




## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.   
