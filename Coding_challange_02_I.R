

###  GitHub link https://github.com/Prasanna-cb/PLPA6820/blob/main/Coding_challange_02_I.R  ###

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

### 2 to 7 ###

library("tidyverse")
MycotoxinData=read.csv ("coding challnages data/MycotoxinData.csv", na.strings = "na") #file path to GitHub repository
head(MycotoxinData) 
ggplot(MycotoxinData, aes(x=Treatment, y=DON, fill =Cultivar))+
geom_boxplot()+
  geom_point(position = position_jitterdodge(), alpha = 0.3)+ # Alpha gives the transparency for the data points
  scale_fill_manual(values= c("orange", "blue"))+
  scale_color_manual()+
  xlab("") +                                            
  ylab("DON (ppm)") +
facet_wrap(~Cultivar, scale= "free")+
  theme_classic()


      ## Transform to a bar chart ##

ggplot(MycotoxinData, aes(x = Treatment, y = DON, fill = Cultivar)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge")+
  geom_point(position = position_jitterdodge(), alpha = 0.3)+ 
  scale_fill_manual(values= c("orange", "blue"))+
  scale_color_manual()+
  xlab("Treatment") +                                            
  ylab("DON (ppm)")+             
facet_wrap(~Cultivar, scale= "free")+
  theme_classic()

      ### END ###

  