
          ###coding challenge 01####
          
#GitHub link https://github.com/Prasanna-cb/PLPA6820/blob/main/Coding_challange_01.R

#   1. Explain the following things about R and Rstudio:

# Where do you type code? Source Editor pane

# Where is the output of the code? Console pane

#`Where do plots show up? plot pane

# What is a global environment? It shows the objects that are currently loaded into R such as data file, vectors.

# How do you get help for a function through R studio? Click on the help pane (bottom right) and type the keywords in search bar what you need to get a help

# What is an R package? Package is a toolkit that can be used to performs a task or a set of tasks on R

# What is a function? Function is a code/s that can be used to perform a specific task/s. Eg:mean

# How do you find the installed and loaded packages? The installed package list are under the "package tab" (bottom right) and the loaded packages are with a tick

# What is a working directory, and how do you find it? working directory mean the folder where I saved the input and output files/plots what I currently work.
#it can be found by running 'getwd()' command
          
# What is a relative file path and how is it different than an absolute file path?
# Relative path is the location of the sub directory relative to a working directory
# Absolute path is is the location of a sub directory from the root file of the computer

#   2.Explain the steps to start a new R project connected to a GitHub repository.
          
#Open GitHub and make a new repository and copy the code(URL) for that repository. 
#open R studio and click on the 'File' tab and select 'new project' and select 'version control' and 'Git'
# paste the copied URL fro the GitHub repository
# choose the path to save the repository in the computer (local)
# click on create project. Now new project connect to GitHub.
          
          
# 3.Please explain the different data classes and how they are similar and different from each other.

# Vector: A data carrier in R that can save the numeric or character variables without row or column information.
        
# Matrix: Matrix is a vector basically but it can be carried raw and column data.
         # But only one type of data among numerical,charter and logical can be stored.   

# Data frame: A data file use in the R. That can be included a several rows and columns data as a single file. 
            # All data types can be stored such as numerical,charter or logical.            
                    

# 4.

# Create a vector named 'z' with the values 1 to 200
z<- c(1:200)

# Print the mean and standard deviation
mean(z) 
sd(z)

# Create a logical vector named zlog that is TRUE for z values > 30
zlog <- z > 30

# Make a dataframe with z and zlog as columns. Name it zdf
zdf <- data.frame(z, zlog)

# Change the column names to “zvec” and “zlogic”
colnames(zdf) <- c("zvec", "zlogic")

# Make a new column in your dataframe equal to zvec squared (i.e., z2). Call the new column zsquared.
zdf$zsquared <- zdf$zvec^2

#Subset the dataframe with and without the subset() function to only include values of zsquared greater than 10 and less than 100

zdf [zdf$zsquared > 10 & zdf$zsquared < 100, ]

zdf <- subset(zdf, zsquared > 10 & zsquared < 100)

#Subset the zdf dataframe to only include the values on row 26
row_26 <- zdf[26, ]

#Subset the zdf dataframe to only include the values in the column zsquared in the 180th row.
zsquared <- zdf$zsquared[180]


#5

TipsR <- read.csv ("D:/AU ED/2026 Spring/PLPA6820/Assignments/Coding_challanges/TipsR.csv" , na.string = ".")  

# see the data seet on the environment pane and confirm weather missing data has been lablled as "NA"

#6 Annotate your code, commit the changes and push it to your GitHub repository you created last class

# Done

 #######END######
