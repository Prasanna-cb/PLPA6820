
                                    # 04.02.2026 
                                    # Renv package
# Package managenet package
# Promblem of not having packege management: All the data and functions sva erelative to my computer
# The packages make a file format called lodfile and restore when necessary
# Main purose is ensure the reproducibility. That allows to run the ame packages with same version as well
#       Steps
# 1.Create a GitHub repository
# Lods necessary packages need to my work 
library(ggplot2)
library(dplyr)
library(tidyverse)
# run code in console as renv:init
# This create a folder name renv on files
# not distrubutethe packes just tell the what packages needed to be installed. So the libry directory can be ignored.
# .R profile mean a hidden file if start with .. Usually do not edit those files
# to open the 
# .libPath() in console

install.packages("MASS") #ask to save in renve in log file
install.packages("paletteer")
                            # Add pacakges to lock file
# When adding a new package need to ask to run renv::snapshot() on console to load the new package to /library or lock file
# SEND ALL OF THEM TO GITHUB



#
#
#
#