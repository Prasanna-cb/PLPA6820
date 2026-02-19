  ### coding challange 3 ###

library("tidyverse")
library(ggpubr)
library(ggrepel)
MycotoxinData=read.csv ("C:/Users/prasa/OneDrive/Desktop/PLPA6820/coding challnages data/MycotoxinData.csv", na.strings = "na") #file path to GitHub repository
head(MycotoxinData) 

      ### 1, 2 & 3 ###

  ggplotMycotoxinData$Cultivar <- as.factor(MycotoxinData$Cultivar)
    MycotoxinData$Treatment <- factor(MycotoxinData$Treatment,levels = c("NTC", "Fg", "Fg + 37", "Fg + 40", "Fg + 70"))
    Fig1 <- ggplot(MycotoxinData, aes(x = Treatment, y = DON, fill = Cultivar)) +
        geom_boxplot(position = position_dodge()) +
        geom_point(position = position_jitterdodge(), alpha = 0.6) +
        scale_fill_manual(values = c("orange", "blue")) +
        xlab("") +
        ylab("DON (ppm)") +
        facet_wrap(~ Cultivar) +
        theme_classic()
    print(Fig1)

    ###################################
    MycotoxinData$Cultivar <- as.factor(MycotoxinData$Cultivar)
      MycotoxinData$Treatment <- factor(MycotoxinData$Treatment,levels = c("NTC", "Fg", "Fg + 37", "Fg + 40", "Fg + 70"))
      Fig2 <-   ggplot(MycotoxinData, aes(x = Treatment, y = X15ADON, fill = Cultivar)) +
            geom_boxplot(position = position_dodge()) +
            geom_point(position = position_jitterdodge(), alpha = 0.6) +
            scale_fill_manual(values = c("orange", "blue")) +
            xlab("") +
            ylab("X15ADON") +
            facet_wrap(~ Cultivar) +
            theme_classic()
      print(Fig2)
      
    ####################################
  MycotoxinData$Cultivar <- as.factor(MycotoxinData$Cultivar)
    MycotoxinData$Treatment <- factor(MycotoxinData$Treatment,levels = c("NTC", "Fg", "Fg + 37", "Fg + 40", "Fg + 70"))
    Fig3 <-   ggplot(MycotoxinData, aes(x = Treatment, y = MassperSeed_mg, fill = Cultivar)) +
          geom_boxplot(position = position_dodge()) +
          geom_point(position = position_jitterdodge(), alpha = 0.6) +
          scale_fill_manual(values = c("orange", "blue")) +
          xlab("") +
          ylab("MassperSeed_mg") +
          facet_wrap(~ Cultivar) +
          theme_classic()
    print(Fig3)
    
    ##################################
           ### 04  ###

    ### Integration of statistics analysis results into plots  ###
  figure_combined <- ggarrange(
  Fig1,
  Fig2,
  Fig3,
  labels = "auto",  
  nrow = 1,
  ncol = 3,
  common.legend = TRUE,  
  legend = "top")
print(figure_combined)


# Q1 What did the common.legend option do: It assign a common legend to the all plots instead of having separate legend for each plots
                                          #Avoid repetition of the same legend

       ### 05  ###        

Fig1a <- Fig1 + 
geom_pwc(aes(group = Treatment), method = "t_test", label = "p.adj.format")        
print(Fig1a)

Fig2a <- Fig2 + 
  geom_pwc(aes(group = Treatment), method = "t_test", label = "p.adj.format")     
print(Fig2a)

Fig3a <- Fig3 + 
  geom_pwc(aes(group = Treatment), method = "t_test", label = "p.adj.format")     
print(Fig3a)

### Integration of pairwise comparison results into a single plot  ###
figure_combined_final <- ggarrange(
  Fig1a,
  Fig2a,
  Fig3a,
  labels = "auto",  
  nrow = 1,
  ncol = 3,
  common.legend = TRUE,  
  legend = "top")
print(figure_combined_final)


