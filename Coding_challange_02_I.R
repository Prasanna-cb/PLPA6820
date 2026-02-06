
#1.Explain the following concepts about ggplot 

  #a.	What three elements do you need to produce a ggplot? 
        #1. Data set, 2.Aesthetic mappings(aes function), 3. A geom function or layer

  #b.	What is a geom? 
        # Geom is a layer that define what type of plot I need.Eg: Box plot, bar chart, line graph

  #c.	What is a facet? 
        # Split one plot into multiple smaller plots or sub plot based on the values of a variable

  #d.	Explain the concept of layering. 
        # Building a plot by stacking components on top of each other. This mean one layer work at one time that allow us to make complex and comprehensive graphs without having complex codes. 
        # We can add each comment step by step as different layers eg: Add x and Y axes, bars, trend line, error bars with different layers

  #e.	Where do you add x and y variables and map different shapes, colors, and other attributes to the data? 
        # Inside the aesthetic (aes) function. 

### 2 ####

library("tidyverse")
MycotoxinData=read.csv ("D:/AU ED/2026 Spring/PLPA6820/Assignments/Coding_challanges/MycotoxinData.csv", na.strings = "na")
head(MycotoxinData)
ggplot(MycotoxinData, aes(x=Treatment, y=DON, fill =Cultivar))+
geom_boxplot()+
xlab("") +                                            
  ylab("DON (ppm)") 

