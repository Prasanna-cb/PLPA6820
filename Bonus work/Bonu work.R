# 04.02.2026 
# R E & V
# Package managenet package
# Promblem of not having packege management: All the data and functions sava relative to my computer
# The packages make a file format called lodfile and restore when necessary
# 
# RENV create a lock file list first and stored them with the function in GitHub 
# Then you can download it and runt in a different computer to secure the reproducibility

# Steps
# 1.Create a GitHub repository
# Load necessary packages need to my work 
library(ggplot2)
library(dplyr)
library(tidyverse)
# run code in console as renv:init
# not distribute the packages just tell the what packages needed to be installed. So the library directory 
# can be ignored.
# The packages are not in github but the function of R is stored in GitHub
#.R profile mean a hidden file if start with .. Usually do not edit those files



# How to use the stored Renv on another computer

# Download the files from GitHub 
# If you try to load a package without opening lock file it won't work
# Need to run renv::restore() on console
# That will load all packages with the function that was used by other user into my computer
# Now I can load the stored packages
#
#
#
#