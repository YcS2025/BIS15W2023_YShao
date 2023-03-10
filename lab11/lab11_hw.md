---
title: "Lab 11 Homework"
author: "Yuchen Shao"
date: "2023-02-21"
output:
  html_document:
    theme: spacelab
    toc: no
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above. For any included plots, make sure they are clearly labeled. You are free to use any plot type that you feel best communicates the results of your analysis.  

**In this homework, you should make use of the aesthetics you have learned. It's OK to be flashy!**

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the libraries

```r
#install.packages("RColorBrewer")
#install.packages("paletteer")
#install.packages("ggthemes")
library(tidyverse)
library(janitor)
library(here)
library(naniar)
library(RColorBrewer)
library(paletteer)
```

## Resources
The idea for this assignment came from [Rebecca Barter's](http://www.rebeccabarter.com/blog/2017-11-17-ggplot2_tutorial/) ggplot tutorial so if you get stuck this is a good place to have a look.  

## Gapminder
For this assignment, we are going to use the dataset [gapminder](https://cran.r-project.org/web/packages/gapminder/index.html). Gapminder includes information about economics, population, and life expectancy from countries all over the world. You will need to install it before use. This is the same data that we will use for midterm 2 so this is good practice.

```r
#install.packages("gapminder")
library("gapminder")
```

## Questions
The questions below are open-ended and have many possible solutions. Your approach should, where appropriate, include numerical summaries and visuals. Be creative; assume you are building an analysis that you would ultimately present to an audience of stakeholders. Feel free to try out different `geoms` if they more clearly present your results.  

**1. Use the function(s) of your choice to get an idea of the overall structure of the data frame, including its dimensions, column names, variable classes, etc. As part of this, determine how NA's are treated in the data.**  

```r
summary(gapminder)
```

```
##         country        continent        year         lifeExp     
##  Afghanistan:  12   Africa  :624   Min.   :1952   Min.   :23.60  
##  Albania    :  12   Americas:300   1st Qu.:1966   1st Qu.:48.20  
##  Algeria    :  12   Asia    :396   Median :1980   Median :60.71  
##  Angola     :  12   Europe  :360   Mean   :1980   Mean   :59.47  
##  Argentina  :  12   Oceania : 24   3rd Qu.:1993   3rd Qu.:70.85  
##  Australia  :  12                  Max.   :2007   Max.   :82.60  
##  (Other)    :1632                                                
##       pop              gdpPercap       
##  Min.   :6.001e+04   Min.   :   241.2  
##  1st Qu.:2.794e+06   1st Qu.:  1202.1  
##  Median :7.024e+06   Median :  3531.8  
##  Mean   :2.960e+07   Mean   :  7215.3  
##  3rd Qu.:1.959e+07   3rd Qu.:  9325.5  
##  Max.   :1.319e+09   Max.   :113523.1  
## 
```

```r
anyNA(gapminder)
```

```
## [1] FALSE
```

**2. Among the interesting variables in gapminder is life expectancy. How has global life expectancy changed between 1952 and 2007?**

```r
gapminder%>%
  mutate(year=as.factor(year))%>%
  ggplot(aes(x=year,y=lifeExp))+
  geom_boxplot()+
  theme(axis.text.x = element_text(angle = 60, hjust=1))+
  labs(title = "Changes in global average life expectancy",
       x = "Year",
       y = "Life expectancy")
```

![](lab11_hw_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

**3. How do the distributions of life expectancy compare for the years 1952 and 2007?**

```r
gapminder %>% 
  filter(year==1952 | year==2007) %>% 
  mutate(year=as.factor(year)) %>% 
  ggplot(aes(x=lifeExp, group=year, fill=year))+
  geom_density(alpha=0.5)
```

![](lab11_hw_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

**4. Your answer above doesn't tell the whole story since life expectancy varies by region. Make a summary that shows the min, mean, and max life expectancy by continent for all years represented in the data.**

```r
gapminder%>%
  group_by(year,continent)%>%
  summarise(mean=mean(lifeExp),
            min=min(lifeExp),
            max=max(lifeExp),
            .groups = "keep")
```

```
## # A tibble: 60 ?? 5
## # Groups:   year, continent [60]
##     year continent  mean   min   max
##    <int> <fct>     <dbl> <dbl> <dbl>
##  1  1952 Africa     39.1  30    52.7
##  2  1952 Americas   53.3  37.6  68.8
##  3  1952 Asia       46.3  28.8  65.4
##  4  1952 Europe     64.4  43.6  72.7
##  5  1952 Oceania    69.3  69.1  69.4
##  6  1957 Africa     41.3  31.6  58.1
##  7  1957 Americas   56.0  40.7  70.0
##  8  1957 Asia       49.3  30.3  67.8
##  9  1957 Europe     66.7  48.1  73.5
## 10  1957 Oceania    70.3  70.3  70.3
## # ??? with 50 more rows
```

**5. How has life expectancy changed between 1952-2007 for each continent?**

```r
gapminder%>%
  ggplot(aes(x=year,y=lifeExp,group=country,color=continent))+geom_line(alpha=0.5)
```

![](lab11_hw_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

```r
gapminder%>%
  group_by(year,continent)%>%
  summarise(mean=mean(lifeExp),.groups = 'keep')%>%
  ggplot(aes(x=year,y=mean,color=continent))+
  geom_line()+geom_point(shape=7)
```

![](lab11_hw_files/figure-html/unnamed-chunk-7-2.png)<!-- -->

```r
  theme(axis.text.x = element_text(angle = 60, hjust=1))+
  labs(title = "Changes in global average life expectancy by continent",
       x = "Year",
       y = "Life expectancy")
```

```
## List of 4
##  $ axis.text.x:List of 11
##   ..$ family       : NULL
##   ..$ face         : NULL
##   ..$ colour       : NULL
##   ..$ size         : NULL
##   ..$ hjust        : num 1
##   ..$ vjust        : NULL
##   ..$ angle        : num 60
##   ..$ lineheight   : NULL
##   ..$ margin       : NULL
##   ..$ debug        : NULL
##   ..$ inherit.blank: logi FALSE
##   ..- attr(*, "class")= chr [1:2] "element_text" "element"
##  $ x          : chr "Year"
##  $ y          : chr "Life expectancy"
##  $ title      : chr "Changes in global average life expectancy by continent"
##  - attr(*, "class")= chr [1:2] "theme" "gg"
##  - attr(*, "complete")= logi FALSE
##  - attr(*, "validate")= logi TRUE
```

**6. We are interested in the relationship between per capita GDP and life expectancy; i.e. does having more money help you live longer?**

```r
gapminder%>%
  ggplot(aes(x=gdpPercap,y=lifeExp))+
  geom_point()+
  geom_smooth(method=lm, se=T)+
  theme(plot.title = element_text(size = rel(1.5), hjust = 0.5))+
  labs(title = "relationship between per capita GDP and life expectancy",
       x = "per capita GDP",
       y = "Life expectancy")+
  scale_x_log10()
```

```
## `geom_smooth()` using formula = 'y ~ x'
```

![](lab11_hw_files/figure-html/unnamed-chunk-8-1.png)<!-- -->

**7. Which countries have had the largest population growth since 1952?**

```r
gapminder %>% 
  select(country, year, pop) %>% 
  filter(year==1952 | year==2007) %>% 
  pivot_wider(names_from = year,
              values_from = pop) %>% 
  mutate(delta=`2007`-`1952`) %>% 
  arrange(desc(delta))
```

```
## # A tibble: 142 ?? 4
##    country          `1952`     `2007`     delta
##    <fct>             <int>      <int>     <int>
##  1 China         556263527 1318683096 762419569
##  2 India         372000000 1110396331 738396331
##  3 United States 157553000  301139947 143586947
##  4 Indonesia      82052000  223547000 141495000
##  5 Brazil         56602560  190010647 133408087
##  6 Pakistan       41346560  169270617 127924057
##  7 Bangladesh     46886859  150448339 103561480
##  8 Nigeria        33119096  135031164 101912068
##  9 Mexico         30144317  108700891  78556574
## 10 Philippines    22438691   91077287  68638596
## # ??? with 132 more rows
```

**8. Use your results from the question above to plot population growth for the top five countries since 1952.**

```r
gapminder %>% 
  filter(country=="China" | country=="India" | country=="United States" | country=="Indonesia" | country=="Brazil") %>% 
  select(country, year, pop) %>% 
  ggplot(aes(x=year, y=pop, color=country))+
  geom_line()+geom_point(shape=6)
```

![](lab11_hw_files/figure-html/unnamed-chunk-10-1.png)<!-- -->

**9. How does per-capita GDP growth compare between these same five countries?**

```r
gapminder %>% 
  filter(country=="China" | country=="India" | country=="United States" | country=="Indonesia" | country=="Brazil") %>%
  select(country, year, gdpPercap) %>% 
  filter(year==1952 | year==2007) %>% 
  ggplot(aes(x=year, y=gdpPercap, color=country))+
  geom_line()
```

![](lab11_hw_files/figure-html/unnamed-chunk-11-1.png)<!-- -->

**10. Make one plot of your choice that uses faceting!**

```r
gapminder%>%
  ggplot(aes(x=year,y=lifeExp,fill=continent))+
  geom_boxplot()+ 
  facet_wrap(~continent, ncol=36)
```

![](lab11_hw_files/figure-html/unnamed-chunk-12-1.png)<!-- -->

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences. 
