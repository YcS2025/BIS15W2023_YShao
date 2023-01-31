---
title: "Midterm 1"
author: "Yuchen Shao"
date: "2023-01-31"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your code should be organized, clean, and run free from errors. Remember, you must remove the `#` for any included code chunks to run. Be sure to add your name to the author header above.  

After the first 50 minutes, please upload your code (5 points). During the second 50 minutes, you may get help from each other- but no copy/paste. Upload the last version at the end of this time, but be sure to indicate it as final. If you finish early, you are free to leave.

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean! Use the tidyverse and pipes unless otherwise indicated. This exam is worth a total of 35 points. 

Please load the following libraries.

```r
library(tidyverse)
```

```
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
## ✔ ggplot2 3.4.0      ✔ purrr   1.0.0 
## ✔ tibble  3.1.8      ✔ dplyr   1.0.10
## ✔ tidyr   1.2.1      ✔ stringr 1.5.0 
## ✔ readr   2.1.3      ✔ forcats 0.5.2 
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
```

```r
library(janitor)
```

```
## 
## Attaching package: 'janitor'
## 
## The following objects are masked from 'package:stats':
## 
##     chisq.test, fisher.test
```

In the midterm 1 folder there is a second folder called `data`. Inside the `data` folder, there is a .csv file called `ecs21351-sup-0003-SupplementS1.csv`. These data are from Soykan, C. U., J. Sauer, J. G. Schuetz, G. S. LeBaron, K. Dale, and G. M. Langham. 2016. Population trends for North American winter birds based on hierarchical models. Ecosphere 7(5):e01351. 10.1002/ecs2.1351.  

Please load these data as a new object called `ecosphere`. In this step, I am providing the code to load the data, clean the variable names, and remove a footer that the authors used as part of the original publication.

```r
ecosphere <- read_csv("data/ecs21351-sup-0003-SupplementS1.csv", skip=2) %>% 
  clean_names() %>%
  slice(1:(n() - 18)) # this removes the footer
```

Problem 1. (1 point) Let's start with some data exploration. What are the variable names?

```r
names(ecosphere)
```

```
##  [1] "order"                       "family"                     
##  [3] "common_name"                 "scientific_name"            
##  [5] "diet"                        "life_expectancy"            
##  [7] "habitat"                     "urban_affiliate"            
##  [9] "migratory_strategy"          "log10_mass"                 
## [11] "mean_eggs_per_clutch"        "mean_age_at_sexual_maturity"
## [13] "population_size"             "winter_range_area"          
## [15] "range_in_cbc"                "strata"                     
## [17] "circles"                     "feeder_bird"                
## [19] "median_trend"                "lower_95_percent_ci"        
## [21] "upper_95_percent_ci"
```

Problem 2. (1 point) Use the function of your choice to summarize the data.

```r
glimpse(ecosphere)
```

```
## Rows: 551
## Columns: 21
## $ order                       <chr> "Anseriformes", "Anseriformes", "Anserifor…
## $ family                      <chr> "Anatidae", "Anatidae", "Anatidae", "Anati…
## $ common_name                 <chr> "American Black Duck", "American Wigeon", …
## $ scientific_name             <chr> "Anas rubripes", "Anas americana", "Buceph…
## $ diet                        <chr> "Vegetation", "Vegetation", "Invertebrates…
## $ life_expectancy             <chr> "Long", "Middle", "Middle", "Long", "Middl…
## $ habitat                     <chr> "Wetland", "Wetland", "Wetland", "Wetland"…
## $ urban_affiliate             <chr> "No", "No", "No", "No", "No", "No", "No", …
## $ migratory_strategy          <chr> "Short", "Short", "Moderate", "Moderate", …
## $ log10_mass                  <dbl> 3.09, 2.88, 2.96, 3.11, 3.02, 2.88, 2.56, …
## $ mean_eggs_per_clutch        <dbl> 9.0, 7.5, 10.5, 3.5, 9.5, 13.5, 10.0, 8.5,…
## $ mean_age_at_sexual_maturity <dbl> 1.0, 1.0, 3.0, 2.5, 2.0, 1.0, 0.6, 2.0, 1.…
## $ population_size             <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ winter_range_area           <dbl> 3212473, 7145842, 1812841, 360134, 854350,…
## $ range_in_cbc                <dbl> 99.1, 61.7, 69.8, 53.7, 5.3, 0.5, 17.9, 72…
## $ strata                      <dbl> 82, 124, 37, 19, 36, 5, 26, 134, 145, 103,…
## $ circles                     <dbl> 1453, 1951, 502, 247, 470, 97, 479, 2189, …
## $ feeder_bird                 <chr> "No", "No", "No", "No", "No", "No", "No", …
## $ median_trend                <dbl> 1.014, 0.996, 1.039, 0.998, 1.004, 1.196, …
## $ lower_95_percent_ci         <dbl> 0.971, 0.964, 1.016, 0.956, 0.975, 1.152, …
## $ upper_95_percent_ci         <dbl> 1.055, 1.009, 1.104, 1.041, 1.036, 1.243, …
```

Problem 3. (2 points) How many distinct orders of birds are represented in the data?

```r
tabyl(ecosphere,order)
```

```
##              order   n     percent
##       Anseriformes  44 0.079854809
##        Apodiformes  15 0.027223230
##   Caprimulgiformes   5 0.009074410
##    Charadriiformes  81 0.147005445
##      Ciconiiformes  29 0.052631579
##      Columbiformes  11 0.019963702
##      Coraciiformes   3 0.005444646
##       Cuculiformes   3 0.005444646
##      Falconiformes  31 0.056261343
##        Galliformes  21 0.038112523
##        Gaviiformes   4 0.007259528
##         Gruiformes  12 0.021778584
##      Passeriformes 237 0.430127042
##         Piciformes  22 0.039927405
##   Podicipediformes   6 0.010889292
##  Procellariiformes   4 0.007259528
##     Psittaciformes   6 0.010889292
##       Strigiformes  16 0.029038113
##      Trogoniformes   1 0.001814882
```

Problem 4. (2 points) Which habitat has the highest diversity (number of species) in the data?

```r
ecosphere%>%
  count(habitat,sort = T)
```

```
## # A tibble: 7 × 2
##   habitat       n
##   <chr>     <int>
## 1 Woodland    177
## 2 Wetland     153
## 3 Shrubland    82
## 4 Various      45
## 5 Ocean        44
## 6 Grassland    36
## 7 <NA>         14
```

Run the code below to learn about the `slice` function. Look specifically at the examples (at the bottom) for `slice_max()` and `slice_min()`. If you are still unsure, try looking up examples online (https://rpubs.com/techanswers88/dplyr-slice). Use this new function to answer question 5 below.

```r
?slice_max
```

Problem 5. (4 points) Using the `slice_max()` or `slice_min()` function described above which species has the largest and smallest winter range?

```r
ecosphere%>%
  group_by(order)%>%
  slice_max(winter_range_area)
```

```
## # A tibble: 19 × 21
## # Groups:   order [19]
##    order    family commo…¹ scien…² diet  life_…³ habitat urban…⁴ migra…⁵ log10…⁶
##    <chr>    <chr>  <chr>   <chr>   <chr> <chr>   <chr>   <chr>   <chr>     <dbl>
##  1 Anserif… Anati… Tufted… Aythya… Vege… Middle  Wetland Yes     Long       2.85
##  2 Apodifo… Apodi… White-… Aerona… Inve… Short   Various No      Short      1.49
##  3 Caprimu… Capri… Common… Nyctid… Inve… Middle  Shrubl… No      Reside…    1.76
##  4 Charadr… Sterc… Pomari… Sterco… Vert… Middle  Ocean   No      Modera…    2.84
##  5 Ciconii… Ardei… Cattle… Bubulc… Inve… Middle  Wetland Yes     Short      2.58
##  6 Columbi… Colum… Ruddy … Columb… Seed  Short   <NA>    Yes     Reside…    1.66
##  7 Coracii… Alced… Green … Chloro… Vert… Short   Wetland No      Reside…    1.57
##  8 Cuculif… Croto… Smooth… Crotop… Inve… Short   Shrubl… Yes     Reside…    2.04
##  9 Falconi… Falco… Peregr… Falco … Vert… Middle  Various Yes     Short      2.88
## 10 Gallifo… Tetra… Ruffed… Bonasa… Vege… Short   Woodla… No      Reside…    2.73
## 11 Gaviifo… Gavii… Common… Gavia … Vert… Short   Wetland No      Modera…    3.7 
## 12 Gruifor… Ralli… Purple… Porphy… Omni… Middle  Wetland No      Short      2.32
## 13 Passeri… Passe… House … Passer… Seed  Middle  <NA>    Yes     Reside…    1.42
## 14 Picifor… Picid… Hairy … Picoid… Omni… Middle  Woodla… Yes     Reside…    1.78
## 15 Podicip… Podic… Pied-b… Podily… Inve… Short   Wetland No      Short      2.62
## 16 Procell… Proce… Sooty … Puffin… Vert… Long    Ocean   No      Long       2.9 
## 17 Psittac… Psitt… Rose-r… Psitta… Fruit Middle  <NA>    Yes     Reside…    2.11
## 18 Strigif… Tyton… Barn O… Tyto a… Vert… Long    Various Yes     Withdr…    2.61
## 19 Trogoni… Trogo… Elegan… Trogon… Omni… Short   Woodla… No      Short      1.85
## # … with 11 more variables: mean_eggs_per_clutch <dbl>,
## #   mean_age_at_sexual_maturity <dbl>, population_size <dbl>,
## #   winter_range_area <dbl>, range_in_cbc <dbl>, strata <dbl>, circles <dbl>,
## #   feeder_bird <chr>, median_trend <dbl>, lower_95_percent_ci <dbl>,
## #   upper_95_percent_ci <dbl>, and abbreviated variable names ¹​common_name,
## #   ²​scientific_name, ³​life_expectancy, ⁴​urban_affiliate, ⁵​migratory_strategy,
## #   ⁶​log10_mass
```


```r
ecosphere%>%
  group_by(order)%>%
  slice_min(winter_range_area)
```

```
## # A tibble: 19 × 21
## # Groups:   order [19]
##    order    family commo…¹ scien…² diet  life_…³ habitat urban…⁴ migra…⁵ log10…⁶
##    <chr>    <chr>  <chr>   <chr>   <chr> <chr>   <chr>   <chr>   <chr>     <dbl>
##  1 Anserif… Anati… Mute S… Cygnus… Vege… Middle  Wetland Yes     Reside…    4.03
##  2 Apodifo… Troch… Allen'… Selasp… Nect… Short   Shrubl… Yes     Modera…    0.53
##  3 Caprimu… Capri… Chuck-… Caprim… Inve… Middle  Woodla… No      Short      2.04
##  4 Charadr… Larid… Mew Gu… Larus … Inve… Long    Ocean   No      Short      2.62
##  5 Ciconii… Phala… Great … Phalac… Vert… Middle  Ocean   No      Short      3.4 
##  6 Columbi… Colum… White-… Patagi… Seed  Middle  Woodla… No      Reside…    2.38
##  7 Coracii… Alced… Belted… Megace… Vert… Short   Wetland No      Short      2.23
##  8 Cuculif… Croto… Groove… Crotop… Inve… Short   Shrubl… No      Withdr…    1.91
##  9 Falconi… Catha… Califo… Gymnog… Vert… Long    Various No      Reside…    3.93
## 10 Gallifo… Odont… Mounta… Oreort… Seed  Short   Shrubl… No      Reside…    2.36
## 11 Gaviifo… Gavii… Yellow… Gavia … Vert… Middle  Wetland No      Modera…    3.69
## 12 Gruifor… Gruid… Whoopi… Grus a… Inve… Middle  Wetland No      Modera…    3.77
## 13 Passeri… Alaud… Skylark Alauda… Seed  Short   Grassl… No      Reside…    1.57
## 14 Picifor… Picid… Nuttal… Picoid… Inve… Middle  Woodla… No      Reside…    1.58
## 15 Podicip… Podic… Red-ne… Podice… Inve… Short   Wetland No      Modera…    3.01
## 16 Procell… Proce… Northe… Fulmar… Vert… Long    Ocean   No      Short      2.79
## 17 Psittac… Psitt… Red-cr… Amazon… Fruit Middle  <NA>    Yes     Reside…    2.5 
## 18 Strigif… Strig… Whiske… Megasc… Vert… Short   Woodla… No      Reside…    1.96
## 19 Trogoni… Trogo… Elegan… Trogon… Omni… Short   Woodla… No      Short      1.85
## # … with 11 more variables: mean_eggs_per_clutch <dbl>,
## #   mean_age_at_sexual_maturity <dbl>, population_size <dbl>,
## #   winter_range_area <dbl>, range_in_cbc <dbl>, strata <dbl>, circles <dbl>,
## #   feeder_bird <chr>, median_trend <dbl>, lower_95_percent_ci <dbl>,
## #   upper_95_percent_ci <dbl>, and abbreviated variable names ¹​common_name,
## #   ²​scientific_name, ³​life_expectancy, ⁴​urban_affiliate, ⁵​migratory_strategy,
## #   ⁶​log10_mass
```

Problem 6. (2 points) The family Anatidae includes ducks, geese, and swans. Make a new object `ducks` that only includes species in the family Anatidae. Restrict this new dataframe to include all variables except order and family.

```r
ducks <- ecosphere%>%
  filter(family=="Anatidae")%>%
  select(-order,-family)
ducks
```

```
## # A tibble: 44 × 19
##    commo…¹ scien…² diet  life_…³ habitat urban…⁴ migra…⁵ log10…⁶ mean_…⁷ mean_…⁸
##    <chr>   <chr>   <chr> <chr>   <chr>   <chr>   <chr>     <dbl>   <dbl>   <dbl>
##  1 "Ameri… Anas r… Vege… Long    Wetland No      Short      3.09     9       1  
##  2 "Ameri… Anas a… Vege… Middle  Wetland No      Short      2.88     7.5     1  
##  3 "Barro… Buceph… Inve… Middle  Wetland No      Modera…    2.96    10.5     3  
##  4 "Black… Branta… Vege… Long    Wetland No      Modera…    3.11     3.5     2.5
##  5 "Black… Melani… Inve… Middle  Wetland No      Modera…    3.02     9.5     2  
##  6 "Black… Dendro… Vege… Short   Wetland No      Withdr…    2.88    13.5     1  
##  7 "Blue-… Anas d… Vege… Middle  Wetland No      Modera…    2.56    10       0.6
##  8 "Buffl… Buceph… Inve… Middle  Wetland No      Short      2.6      8.5     2  
##  9 "Cackl… Branta… Vege… Middle  Wetland Yes     Short      3.45     5       1  
## 10 "Canva… Aythya… Vege… Middle  Wetland No      Short      3.08     8       1  
## # … with 34 more rows, 9 more variables: population_size <dbl>,
## #   winter_range_area <dbl>, range_in_cbc <dbl>, strata <dbl>, circles <dbl>,
## #   feeder_bird <chr>, median_trend <dbl>, lower_95_percent_ci <dbl>,
## #   upper_95_percent_ci <dbl>, and abbreviated variable names ¹​common_name,
## #   ²​scientific_name, ³​life_expectancy, ⁴​urban_affiliate, ⁵​migratory_strategy,
## #   ⁶​log10_mass, ⁷​mean_eggs_per_clutch, ⁸​mean_age_at_sexual_maturity
```

Problem 7. (2 points) We might assume that all ducks live in wetland habitat. Is this true for the ducks in these data? If there are exceptions, list the species below.

```r
filter(ducks,habitat!="wetland")
```

```
## # A tibble: 44 × 19
##    commo…¹ scien…² diet  life_…³ habitat urban…⁴ migra…⁵ log10…⁶ mean_…⁷ mean_…⁸
##    <chr>   <chr>   <chr> <chr>   <chr>   <chr>   <chr>     <dbl>   <dbl>   <dbl>
##  1 "Ameri… Anas r… Vege… Long    Wetland No      Short      3.09     9       1  
##  2 "Ameri… Anas a… Vege… Middle  Wetland No      Short      2.88     7.5     1  
##  3 "Barro… Buceph… Inve… Middle  Wetland No      Modera…    2.96    10.5     3  
##  4 "Black… Branta… Vege… Long    Wetland No      Modera…    3.11     3.5     2.5
##  5 "Black… Melani… Inve… Middle  Wetland No      Modera…    3.02     9.5     2  
##  6 "Black… Dendro… Vege… Short   Wetland No      Withdr…    2.88    13.5     1  
##  7 "Blue-… Anas d… Vege… Middle  Wetland No      Modera…    2.56    10       0.6
##  8 "Buffl… Buceph… Inve… Middle  Wetland No      Short      2.6      8.5     2  
##  9 "Cackl… Branta… Vege… Middle  Wetland Yes     Short      3.45     5       1  
## 10 "Canva… Aythya… Vege… Middle  Wetland No      Short      3.08     8       1  
## # … with 34 more rows, 9 more variables: population_size <dbl>,
## #   winter_range_area <dbl>, range_in_cbc <dbl>, strata <dbl>, circles <dbl>,
## #   feeder_bird <chr>, median_trend <dbl>, lower_95_percent_ci <dbl>,
## #   upper_95_percent_ci <dbl>, and abbreviated variable names ¹​common_name,
## #   ²​scientific_name, ³​life_expectancy, ⁴​urban_affiliate, ⁵​migratory_strategy,
## #   ⁶​log10_mass, ⁷​mean_eggs_per_clutch, ⁸​mean_age_at_sexual_maturity
```

Problem 8. (4 points) In ducks, how is mean body mass associated with migratory strategy? Do the ducks that migrate long distances have high or low average body mass?


Problem 9. (2 points) Accipitridae is the family that includes eagles, hawks, kites, and osprey. First, make a new object `eagles` that only includes species in the family Accipitridae. Next, restrict these data to only include the variables common_name, scientific_name, and population_size.


Problem 10. (4 points) In the eagles data, any species with a population size less than 250,000 individuals is threatened. Make a new column `conservation_status` that shows whether or not a species is threatened.


Problem 11. (2 points) Consider the results from questions 9 and 10. Are there any species for which their threatened status needs further study? How do you know?


Problem 12. (4 points) Use the `ecosphere` data to perform one exploratory analysis of your choice. The analysis must have a minimum of three lines and two functions. You must also clearly state the question you are attempting to answer.


Please provide the names of the students you have worked with with during the exam:


Please be 100% sure your exam is saved, knitted, and pushed to your github repository. No need to submit a link on canvas, we will find your exam in your repository.
