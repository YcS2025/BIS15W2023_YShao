---
title: "BIS 15L Midterm 2"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your code should be organized, clean, and run free from errors. Remember, you must remove the `#` for any included code chunks to run. Be sure to add your name to the author header above.  

After the first 50 minutes, please upload your code (5 points). During the second 50 minutes, you may get help from each other- but no copy/paste. Upload the last version at the end of this time, but be sure to indicate it as final. If you finish early, you are free to leave.

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean! Use the tidyverse and pipes unless otherwise indicated. To receive full credit, all plots must have clearly labeled axes, a title, and consistent aesthetics. This exam is worth a total of 35 points. 

Please load the following libraries.

```r
library("tidyverse")
library("janitor")
library("naniar")
```

## Data
These data are from a study on surgical residents. The study was originally published by Sessier et al. “Operation Timing and 30-Day Mortality After Elective General Surgery”. Anesth Analg 2011; 113: 1423-8. The data were cleaned for instructional use by Amy S. Nowacki, “Surgery Timing Dataset”, TSHS Resources Portal (2016). Available at https://www.causeweb.org/tshs/surgery-timing/.

Descriptions of the variables and the study are included as pdf's in the data folder.  

Please run the following chunk to import the data.

```r
surgery <- read_csv("data/surgery.csv")
```

1. (2 points) Use the summary function(s) of your choice to explore the data and get an idea of its structure. Please also check for NA's.

```r
summary(surgery)
```

```
##    ahrq_ccs              age           gender              race          
##  Length:32001       Min.   : 1.00   Length:32001       Length:32001      
##  Class :character   1st Qu.:48.20   Class :character   Class :character  
##  Mode  :character   Median :58.60   Mode  :character   Mode  :character  
##                     Mean   :57.66                                        
##                     3rd Qu.:68.30                                        
##                     Max.   :90.00                                        
##                     NA's   :2                                            
##   asa_status             bmi        baseline_cancer    baseline_cvd      
##  Length:32001       Min.   : 2.15   Length:32001       Length:32001      
##  Class :character   1st Qu.:24.60   Class :character   Class :character  
##  Mode  :character   Median :28.19   Mode  :character   Mode  :character  
##                     Mean   :29.45                                        
##                     3rd Qu.:32.81                                        
##                     Max.   :92.59                                        
##                     NA's   :3290                                         
##  baseline_dementia  baseline_diabetes  baseline_digestive baseline_osteoart 
##  Length:32001       Length:32001       Length:32001       Length:32001      
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##  baseline_psych     baseline_pulmonary baseline_charlson mortality_rsi    
##  Length:32001       Length:32001       Min.   : 0.000    Min.   :-4.4000  
##  Class :character   Class :character   1st Qu.: 0.000    1st Qu.:-1.2400  
##  Mode  :character   Mode  :character   Median : 0.000    Median :-0.3000  
##                                        Mean   : 1.184    Mean   :-0.5316  
##                                        3rd Qu.: 2.000    3rd Qu.: 0.0000  
##                                        Max.   :13.000    Max.   : 4.8600  
##                                                                           
##  complication_rsi  ccsmort30rate      ccscomplicationrate      hour      
##  Min.   :-4.7200   Min.   :0.000000   Min.   :0.01612     Min.   : 6.00  
##  1st Qu.:-0.8400   1st Qu.:0.000789   1st Qu.:0.08198     1st Qu.: 7.65  
##  Median :-0.2700   Median :0.002764   Median :0.10937     Median : 9.65  
##  Mean   :-0.4091   Mean   :0.004312   Mean   :0.13325     Mean   :10.38  
##  3rd Qu.: 0.0000   3rd Qu.:0.007398   3rd Qu.:0.18337     3rd Qu.:12.72  
##  Max.   :13.3000   Max.   :0.016673   Max.   :0.46613     Max.   :19.00  
##                                                                          
##      dow               month            moonphase            mort30         
##  Length:32001       Length:32001       Length:32001       Length:32001      
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##  complication      
##  Length:32001      
##  Class :character  
##  Mode  :character  
##                    
##                    
##                    
## 
```
2. (3 points) Let's explore the participants in the study. Show a count of participants by race AND make a plot that visually represents your output.

```r
surgery%>%
  count(race)%>%
  ggplot(aes(x=race,y=n,fill=race))+
  geom_col()+
  labs(title = "participants count by race",
       x="race")+
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 60,hjust = 1))+
  theme_linedraw()
```

![](midterm_2_version2_files/figure-html/unnamed-chunk-4-1.png)<!-- -->
3. (2 points) What is the mean age of participants by gender? (hint: please provide a number for each) Since only three participants do not have gender indicated, remove these participants from the data.

```r
surgery%>%
  group_by(gender)%>%
  na_if("")%>%
  filter(gender!="NA")%>%
  summarise(mean_age=mean(age,na.rm=T))
```

```
## # A tibble: 2 × 2
##   gender mean_age
##   <chr>     <dbl>
## 1 F          56.7
## 2 M          58.8
```
4. (3 points) Make a plot that shows the range of age associated with gender.

```r
surgery%>%
  group_by(gender)%>%
  na_if("")%>%
  filter(gender!="NA")%>%
  ggplot(aes(x=gender,y=age,fill=gender))+
  geom_boxplot(na.rm = T)+
  labs(title = "range of age associated with gender",
       x="gender",
       y="age")+
  theme(plot.title = element_text(size = rel(1.5),hjust = 0.5))
```

![](midterm_2_version2_files/figure-html/unnamed-chunk-6-1.png)<!-- -->
5. (2 points) How healthy are the participants? The variable `asa_status` is an evaluation of patient physical status prior to surgery. Lower numbers indicate fewer comorbidities (presence of two or more diseases or medical conditions in a patient). Make a plot that compares the number of `asa_status` I-II, III, and IV-V.

```r
surgery%>%
  group_by(asa_status)%>%
  filter(asa_status!="NA")%>%
  ggplot(aes(x=asa_status,fill=asa_status))+
  geom_bar()+
  labs(title = "Comparation of the number of `asa_status",
       x="asa_status")+
  theme(plot.title = element_text(size = rel(1),hjust = 0.5),
        legend.position = "bottom",
        axis.text.x = element_text(angle = 60,hjust = 1))+
  theme_linedraw()
```

![](midterm_2_version2_files/figure-html/unnamed-chunk-7-1.png)<!-- -->
6. (3 points) Create a plot that displays the distribution of body mass index for each `asa_status` as a probability distribution- not a histogram. (hint: use faceting!)

```r
surgery%>%
  group_by(asa_status)%>%
  filter(asa_status!="NA")%>%
  ggplot(aes(x=bmi,fill=asa_status))+
  geom_density()+
  facet_wrap(~asa_status,ncol=3)+
  labs(title = "probability distribution of body mass for each `asa_status`",
       x="paobability",
       fill="asa_status")
```

```
## Warning: Removed 3289 rows containing non-finite values (`stat_density()`).
```

![](midterm_2_version2_files/figure-html/unnamed-chunk-8-1.png)<!-- -->
The variable `ccsmort30rate` is a measure of the overall 30-day mortality rate associated with each type of operation. The variable `ccscomplicationrate` is a measure of the 30-day in-hospital complication rate. The variable `ahrq_ccs` lists each type of operation.  

7. (4 points) What are the 5 procedures associated with highest risk of 30-day mortality AND how do they compare with the 5 procedures with highest risk of complication? (hint: no need for a plot here)

```r
surgery%>%
  count(ahrq_ccs)%>%
  slice_max(n,n=5)
```

```
## # A tibble: 5 × 2
##   ahrq_ccs                                n
##   <chr>                               <int>
## 1 Arthroplasty knee                    3379
## 2 Nephrectomy; partial or complete     2894
## 3 Spinal fusion                        2694
## 4 Open prostatectomy                   2679
## 5 Hysterectomy; abdominal and vaginal  2548
```

```r
surgery%>%
  count(ccscomplicationrate)%>%
  slice_max(n,n=5)
```

```
## # A tibble: 5 × 2
##   ccscomplicationrate     n
##                 <dbl> <int>
## 1              0.0820  3379
## 2              0.197   2894
## 3              0.183   2694
## 4              0.109   2679
## 5              0.151   2548
```
8. (3 points) Make a plot that compares the `ccsmort30rate` for all listed `ahrq_ccs` procedures.

```r
surgery%>%
  group_by(ahrq_ccs)%>%
  summarise(mean=mean(ccsmort30rate))%>%
  ggplot(aes(x=ahrq_ccs,y=mean))+coord_flip()+
  geom_col(na.rm = T)+
  labs(title = "comparation of the average of ccsmort30rate for all `asa_status`",
       x="ahrq_ccs",
       fill="mean of ccsmort30rate")
```

![](midterm_2_version2_files/figure-html/unnamed-chunk-10-1.png)<!-- -->

9. (4 points) When is the best month to have surgery? Make a chart that shows the 30-day mortality and complications for the patients by month. `mort30` is the variable that shows whether or not a patient survived 30 days post-operation.

```r
surgery_result<-surgery%>%
  group_by(month)%>%
  mutate(mort30=ifelse(mort30=="Yes",1,0))%>%
  summarise(death=sum(mort30),
            n(),
            mortality=death/n())%>%
  arrange(-mortality)
surgery_result
```

```
## # A tibble: 12 × 4
##    month death `n()` mortality
##    <chr> <dbl> <int>     <dbl>
##  1 Jan      19  2670   0.00712
##  2 Feb      17  2506   0.00678
##  3 Jul      12  2325   0.00516
##  4 Sep      16  3208   0.00499
##  5 Jun      14  2994   0.00468
##  6 Mar      12  2697   0.00445
##  7 Apr      12  2698   0.00445
##  8 May      10  2654   0.00377
##  9 Oct       8  2689   0.00298
## 10 Aug       9  3177   0.00283
## 11 Dec       4  1839   0.00218
## 12 Nov       5  2544   0.00197
```

10. (4 points) Make a plot that visualizes the chart from question #9. Make sure that the months are on the x-axis. Do a search online and figure out how to order the months Jan-Dec.

```r
Months_list<-c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
surgery_result%>%
  mutate(month=factor(month,levels = Months_list))%>%
  ggplot(aes(x=month,y=mortality))+geom_col()+labs(title = "mortality by months",
       x="months",
       fill="mortality")
```

![](midterm_2_version2_files/figure-html/unnamed-chunk-12-1.png)<!-- -->

Please provide the names of the students you have worked with with during the exam:

Please be 100% sure your exam is saved, knitted, and pushed to your github repository. No need to submit a link on canvas, we will find your exam in your repository.
