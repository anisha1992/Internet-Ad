#Pratice on Capstone Data Set - EDA
####Importing Data set from text file: 
read.csv("~/Practice Internet Ad/Ad Practice/ad-dataset (2)/ad.data", header=FALSE)

###Summary Stats
summary(ad)

### Get the shape of the data
## Get the "shape" of the data
dim(ad)
head(ad)
tail(ad)
str(ad)

###Variable labels (df dataset)
install.packages("readxl")
library(readxl)
df <- read_excel("Variable name .xlsx")

##Transposing from column to row 
View(t(df))

var.names <- t(df)

##Attaching Varible Labels to the dataset 
colnames(ad) <- var.names 


### Converting variables into relevant vectors:
## Variable 1:4 from factor to numeric
install.packages("plyr")
install.packages("dplyr")
library(plyr)
library(dplyr)

#(Delete this possibly)
indx <- sapply(ad, is.factor)
ad[indx] <- lapply(ad[indx], function(x) as.numeric(as.character(x)))

##Subsetting the dataset to keep out the dependent variables from all the conversions
newdata <- ad[c(-1559)]
indx <- sapply(newdata, is.factor)
newdata[indx] <- lapply(newdata[indx], function(x) as.numeric(as.character(x)))

##Adding the dependent variable back in 
newdata$ad_detected <- ad$`ad/nonad`

##Converting integers to factors 
## variable 4:1558 from integer to factor

indx2 <- sapply(newdata, is.integer)
ad[indx2] <- lapply(newdata[indx2], as.factor)


## Checking str(ad)
str(newdata)

## Convert "local" variable from numeric to facto
as.factor(newdata$`local `)
newdata$`local `<- as.factor(newdata$`local `)


##Find a threshold value for when to not use a specific column? 
### remove any columns that may have more than 5% values missing

final_data <- newdata[,colSums(is.na(newdata)) < 163]

###check how many NA are left 
sum(is.na(final_data))

## Removing rows with NA data -- don't want to do this 
final_data2 <- final_data[rowSums(is.na(final_data)) < 0,]

