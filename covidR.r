library(ggplot2)
library(Hmisc)

covid <- read.csv("/Users/prags/Downloads/covid.csv", na.strings = c(""))

# 1. Show descriptive statistics for the dataset. 
head(covid)
summary(covid)
describe(covid)

colnames(covid) <- c("S","T","P","V","U","C","CP","H")

# 2. What state has the 
##   greatest number of unvaccinated people?
max(covid$U)
##Answer: Georgia with 2,52,604 unvaccinated people

# 3. What state has the greatest
##   number of covid patients? 
max(covid$CP)
##Answer: New York with 5,000 covid patients

# 4. What state has the least number of hospitals? 
min(covid$H)
## Answer: Wyoming and Alaska with 9 Hospitals 

# 5. What state has the least number of centers? 
min(covid$C)
## Answer: Wyoming with 7 centers 

# 6. What is the mean of the 
##   unvaccinated population in America
mean(covid$U)
## Answer: The mean of the unvaccinated population is 24266.92

# 7. What is the mean of covid patients across America?
mean(covid$CP)
## Answer: The mean of covid patients across US is 364.9804

# 8. How many covid patients differ from the mean value?
sd(covid$CP)
## Answer: 727.8889 covid patients differ from the mean

# 9. How many unvaccinated people differ from the mean value?
sd(covid$U)
## Answer: 38228.25 unvaccinated people differ from the mean value

# 10. Show a descriptive summary of the dataset.
summary(covid)

# 11. Calculate number of potential vaccination 
##    centers: Hospitals that can be turned into a 
##    vaccination centers in America. 
counter <- 0.0 
totalCtr <- sum(covid$C)
totalHsp <- sum(covid$H)

if (totalCtr != totalHsp)
  counter <- totalHsp - totalCtr

print(counter)
## Answer: 60 hospitals can be turned into vaccination centers

# 12. Visualize distribution of:

# a.	Number of unvaccinated people with respect to number 
## of available centers to see if the number of centers 
## satisfy the requirement. 
ggplot(data=covid, aes(x=C, y=U)) + geom_point()

# b.	Number of unvaccinated people with 
## respect to the population to observe the relationship.
ggplot(data=covid, aes(x=U, y=P)) + geom_line()

# c.	Number of unvaccinated people with respect to the states to observe the relationship.
ggplot(data=covid, aes(x=S, y=U)) + geom_point()

# d.	Number of covid patients with respect to the number of hospitals.
ggplot(data=covid, aes(x=H, y=CP)) + geom_point()

# e.	Number of covid patients with respect to the respective state. 
ggplot(data=covid, aes(x=S, y=CP)) + geom_point()

# f.	Number of covid patients with respect to the population of the state. 
ggplot(data=covid, aes(x=CP, y=P)) + geom_point()

# g. Number of hospitals with respect to the states
ggplot(data=covid, aes(x=S, y=H)) + geom_point()




