#Pratice on Capstone Data Set - EDA
####Importing Data set from web url
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

install.packages("dplyr")
install.packages("plyr")
library(dplyr)
library(plyr)

indx <- sapply(ad, is.factor)
ad[indx] <- lapply(ad[indx], function(x) as.numeric(as.character(x)))

##Converting integers to factors 
## variable 4:1558 from integer to factor

indx2 <- sapply(ad, is.integer)
ad[indx2] <- lapply(ad[indx2], as.factor)


## Checking str(ad)
str(ad)

## Convert "local" variable from numeric to facto
as.factor(ad$`local `)
ad$`local `<- as.factor(ad$`local `)


##convert dependent variable into factor from numeric 



## Removing rows with NA data -- don't want to do this 
new_ad <- ad[rowSums(is.na(ad)) > 0,]
new_ad2 <- ad[colSums(is.na(ad)) > 0,]

### Leaves us with 0 rows


##Find a threshold value for when to not use a specific column? 
## OR REPLACE WITH MEAN OR MODE
