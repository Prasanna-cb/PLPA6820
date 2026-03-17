### loading necessary package

``` r
library(tidyverse)
```

    ## Warning: package 'tidyverse' was built under R version 4.4.3

    ## Warning: package 'ggplot2' was built under R version 4.4.3

    ## Warning: package 'tidyr' was built under R version 4.4.3

    ## Warning: package 'readr' was built under R version 4.4.3

    ## Warning: package 'purrr' was built under R version 4.4.3

    ## Warning: package 'dplyr' was built under R version 4.4.3

    ## Warning: package 'stringr' was built under R version 4.4.3

    ## Warning: package 'forcats' was built under R version 4.4.3

    ## Warning: package 'lubridate' was built under R version 4.4.3

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.6
    ## ✔ forcats   1.0.1     ✔ stringr   1.5.1
    ## ✔ ggplot2   4.0.1     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.4     ✔ tidyr     1.3.1
    ## ✔ purrr     1.0.4     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

### 1. import two data files

``` r
Metadata=read.csv ("Metadata.csv", na.strings = "na")
head(Metadata)
```

    ##     Code Crop Time_Point Replicate Water_Imbibed
    ## 1 S01_13 Soil          0         1            NA
    ## 2 S02_16 Soil          0         2            NA
    ## 3 S03_19 Soil          0         3            NA
    ## 4 S04_22 Soil          0         4            NA
    ## 5 S05_25 Soil          0         5            NA
    ## 6 S06_28 Soil          0         6            NA

``` r
DiversityData= read.csv ("DiversityData.csv", na.strings = "na")
head(DiversityData)
```

    ##     Code  shannon invsimpson   simpson richness
    ## 1 S01_13 6.624921   210.7279 0.9952545     3319
    ## 2 S02_16 6.612413   206.8666 0.9951660     3079
    ## 3 S03_19 6.660853   213.0184 0.9953056     3935
    ## 4 S04_22 6.660671   204.6908 0.9951146     3922
    ## 5 S05_25 6.610965   200.2552 0.9950064     3196
    ## 6 S06_28 6.650812   199.3211 0.9949830     3481

### 2. Join the two dataframes together by the common column ‘Code’ and rename it as a new dataframe “alpha”

``` r
alpha <- left_join(Metadata, DiversityData, by = "Code")
head(alpha)
```

    ##     Code Crop Time_Point Replicate Water_Imbibed  shannon invsimpson   simpson
    ## 1 S01_13 Soil          0         1            NA 6.624921   210.7279 0.9952545
    ## 2 S02_16 Soil          0         2            NA 6.612413   206.8666 0.9951660
    ## 3 S03_19 Soil          0         3            NA 6.660853   213.0184 0.9953056
    ## 4 S04_22 Soil          0         4            NA 6.660671   204.6908 0.9951146
    ## 5 S05_25 Soil          0         5            NA 6.610965   200.2552 0.9950064
    ## 6 S06_28 Soil          0         6            NA 6.650812   199.3211 0.9949830
    ##   richness
    ## 1     3319
    ## 2     3079
    ## 3     3935
    ## 4     3922
    ## 5     3196
    ## 6     3481

### 3. Calculate Pielou’s evenness index
