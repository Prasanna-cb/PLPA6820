
          ###coding challenge 01####

#1. Explain the following things about R and Rstudio:

# Where do you type code? Source Editor pane

# Where is the output of the code? Console pane

#`Where do plots show up? plot pane

# What is a global environment? It show the data files or vectors like data that we upload to the R

# How do you get help for a function through R studio? Click on the help pane (bottom right) and select a resource available there  

# What is an R package? Package is a tool that can be used to performs s set of task on R. 

# What is a function? Function can be used to identify a variable in R

# How do you find the installed and loaded packages? The installed package list are under the "package tab" (bottom right) and the loaded packages are with a tick
# to identify the things, 

# What is a working directory, and how do you find it? working directory mean where do you reposited/saved the file you are are currently working
#it can be found by running 'getwd()' command


#2.Explain the steps to start a new R project connected to a GitHub repository.

#Open GitHub and make a new repository and copy the code for that repository. 
#open R studio and click on the 'File' tab and select 'new project' and select option to 

#What is a relative file path and how is it different than an absolute file path?
# Relative path is the location of the sub directory relative to a working directory
# Absolute path is is the location of a sub directory from the root file of the computer

#Please explain the different data classes and how they are similar and different from each other.

# 3. 
# Vector: A data carrier in R that can save the numeric or character variables
# Data frame: 
# Matrix: 

# 4.
z<- c(1:200)
mean(z) 
sd(z)
zlog <- 30:200
zlog[(z>30 & z<30)]

#5

TipsR <- read.csv ("D:/AU ED/2026 Spring/PLPA6820/Assignments/Coding_challanges/TipsR.csv" , na.string = ".")  

# see the data seet on the environment pane and confirm weather missing data has been lablled as "NA"

#6


