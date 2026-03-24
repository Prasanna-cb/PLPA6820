[GitHub
link](https://github.com/Prasanna-cb/PLPA6820/tree/main/Coding%20challage%20_6)

### 1. Regarding reproducibility, what is the main point of writing your own functions and iterations

### It improves reproducibility because it ensures that the same analysis steps are applied consistently across different datasets. It avoids manual repetition and reduces the risk of human errors such as incorrect copying or editing. In addition, it makes the code more organized, easier to understand, and easier for others to reproduce the results.

### 2. Conceptual: In your own words, describe: 1) how to write a function in R, and 2) how to write a for loop in R. In your answer, be specific about: basic syntax, where the code is written, and how results are returned or stored.

### A function in R is written using the function () keyword. First, give the function a name, then put the input variables inside the parentheses. The actual code is written inside curly brackets {}. Inside the function, perform the calculation and use return() to give back the result.

### A for loop in R is used to repeat a piece of code multiple times. The basic syntax is for (i in sequence) { }, where i takes values from a sequence like 1:10. The code inside the curly brackets is executed for each value of i.

### loading necessary package

``` r
library(ggplot2)
 library(drc) 
 library(tidyverse)
```

### 3. import two data files

``` r
citydata=read.csv ("Cities.csv", na.strings = "na")
head(citydata)
```

    ##          city  city_ascii state_id state_name county_fips county_name     lat
    ## 1    New York    New York       NY   New York       36081      Queens 40.6943
    ## 2 Los Angeles Los Angeles       CA California        6037 Los Angeles 34.1141
    ## 3     Chicago     Chicago       IL   Illinois       17031        Cook 41.8375
    ## 4       Miami       Miami       FL    Florida       12086  Miami-Dade 25.7840
    ## 5     Houston     Houston       TX      Texas       48201      Harris 29.7860
    ## 6      Dallas      Dallas       TX      Texas       48113      Dallas 32.7935
    ##        long population density
    ## 1  -73.9249   18832416 10943.7
    ## 2 -118.4068   11885717  3165.8
    ## 3  -87.6866    8489066  4590.3
    ## 4  -80.2101    6113982  4791.1
    ## 5  -95.3885    6046392  1386.5
    ## 6  -96.7667    5843632  1477.2

``` r
str(citydata)
```

    ## 'data.frame':    40 obs. of  10 variables:
    ##  $ city       : chr  "New York" "Los Angeles" "Chicago" "Miami" ...
    ##  $ city_ascii : chr  "New York" "Los Angeles" "Chicago" "Miami" ...
    ##  $ state_id   : chr  "NY" "CA" "IL" "FL" ...
    ##  $ state_name : chr  "New York" "California" "Illinois" "Florida" ...
    ##  $ county_fips: int  36081 6037 17031 12086 48201 48113 42101 13121 11001 25025 ...
    ##  $ county_name: chr  "Queens" "Los Angeles" "Cook" "Miami-Dade" ...
    ##  $ lat        : num  40.7 34.1 41.8 25.8 29.8 ...
    ##  $ long       : num  -73.9 -118.4 -87.7 -80.2 -95.4 ...
    ##  $ population : int  18832416 11885717 8489066 6113982 6046392 5843632 5696588 5211164 5146120 4355184 ...
    ##  $ density    : num  10944 3166 4590 4791 1386 ...

### 4.Function writing

``` r
distance <- function(lat1, lon1, lat2, lon2){
  #convert to radians
  rad.lat1 <- lat1 * pi/180
  rad.lon1 <- lon1 * pi/180
  rad.lat2 <- lat2 * pi/180
  rad.lon2 <- lon2 * pi/180
  
  #Haversine formula
  delta_lat <- rad.lat2 - rad.lat1
  delta_lon <- rad.lon2 - rad.lon1
  a <- sin(delta_lat / 2)^2 + cos(rad.lat1) * cos(rad.lat2) * sin(delta_lon / 2)^2
  c <- 2 * asin(sqrt(a))
  
  #Earth's radius in km
  earth_radius <- 6378137
  
  #Calculate the distance
  distance_km <- (earth_radius * c)/1000
  return(distance_km)
}
```

### 5.Calculate the distance between Auburn and New York

``` r
Au_NY <- function(start, destination)
{
  cord_extract <- citydata %>% 
  select(city, lat, long) %>%
  filter(city == start | city == destination) %>%
  group_by(city)
head(cord_extract)
cords <- list(cord_extract$lat, cord_extract$long)
latitude_1 <- cords[[1]][1]
latitude_2 <- cords[[1]][2]
longitude_1 <- cords[[2]][1]
longitude_2 <- cords[[2]][2]
return(distance(latitude_1, longitude_1, latitude_2, longitude_2))
}

Au_NY ("New York", "Auburn")
```

    ## [1] 1367.854

### 6. Use your distance function inside a for loop to calculate the distance between Auburn, AL and every other city in Cities.csv.

``` r
Au_to_cities <- unique(citydata$city)
for (i in seq_along(Au_to_cities)) {
  results <- Au_NY(Au_to_cities[[i]], "Auburn" )
  print(results)
}
```

    ## [1] 1367.854
    ## [1] 3051.838
    ## [1] 1045.521
    ## [1] 916.4138
    ## [1] 993.0298
    ## [1] 1056.022
    ## [1] 1239.973
    ## [1] 162.5121
    ## [1] 1036.99
    ## [1] 1665.699
    ## [1] 2476.255
    ## [1] 1108.229
    ## [1] 3507.959
    ## [1] 3388.366
    ## [1] 2951.382
    ## [1] 1530.2
    ## [1] 591.1181
    ## [1] 1363.207
    ## [1] 1909.79
    ## [1] 1380.138
    ## [1] 2961.12
    ## [1] 2752.814
    ## [1] 1092.259
    ## [1] 796.7541
    ## [1] 3479.538
    ## [1] 1290.549
    ## [1] 3301.992
    ## [1] 1191.666
    ## [1] 608.2035
    ## [1] 2504.631
    ## [1] 3337.278
    ## [1] 800.1452
    ## [1] 1001.088
    ## [1] 732.5906
    ## [1] 1371.163
    ## [1] 1091.897
    ## [1] 1043.273
    ## [1] 851.3423
    ## [1] 1382.372
    ## [1] NA

### Modify your loop so that each iteration appends one new row to a dataframe with the following columns

- City1 (the other city)
- City2 (Auburn)
- Distance_km

``` r
all_distances <- NULL
Au_to_cities <- unique(citydata$city)
for (i in seq_along(Au_to_cities)) {
  results <- Au_NY(Au_to_cities[[i]], "Auburn" )
  distance_i <- data.frame(Au_to_cities[[i]], "Auburn", results)
  colnames(distance_i) <- c("Destination", "Origin", "Distance (Km)")
  all_distances <- rbind.data.frame(all_distances, distance_i)
}

head(all_distances)
```

    ##   Destination Origin Distance (Km)
    ## 1    New York Auburn     1367.8540
    ## 2 Los Angeles Auburn     3051.8382
    ## 3     Chicago Auburn     1045.5213
    ## 4       Miami Auburn      916.4138
    ## 5     Houston Auburn      993.0298
    ## 6      Dallas Auburn     1056.0217
