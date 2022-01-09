
############# Question One ###############

#Download the csv file
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
              , 'QUIZ1.csv'
              , method='curl' )

#Read the csv file into R
quiz_a <- read.csv('QUIZ1.csv')

#See the top data
head(quiz_a)

#check the names of the columns
names(quiz_a)

#number of rows
nrow(subset(quiz_a, quiz_a$VAL == 24))

#number of columns
ncol(subset(quiz_a, quiz_a$VAL == 24, VAL))

#sum of 
sum(quiz_a$VAL == 24)
head(quiz_a$FES, 50)

############# Question Two ###############

#Answer: Tidy data has one variable per column. 

############# Question Three ###############

download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx','QUIZ2.xlsx',method ='curl')
dateDownloaded <- date()
dateDownloaded
install.packages("openxlsx")
library("openxlsx")
row = 18 : 23
col = 7 : 15
View(doc_1) <- read.xlsx("QUIZ2.xlsx", detectDates = TRUE)
dat <- read.xlsx("QUIZ2.xlsx", detectDates = TRUE, rows = row, cols = col)
View(dat)
sum(dat$Zip*dat$Ext,na.rm=T)

############# Question Four ###############
install.packages("XML")
library(XML)

download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml ', 
              'quiz4.xml', method = "curl" )
doc <- xmlTreeParse('quiz4.xml', useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
xmlSApply(rootNode, xmlValue)
zip <- xpathSApply(rootNode, ".//zipcode", xmlValue)
sum(zip==21231)

download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv', 
              'quiz5.csv', method ='curl')
doc3 <- read.csv('quiz5.csv') # OR
install.packages('data.table')
library(data.table)
DT <- fread('quiz5.csv')
View(DT)
which(names(DT)== 'pwgtp15')

#checking the real syntax for the average

tapply(DT$pwgtp15,DT$SEX,mean)                #correct average

sapply(split(DT$pwgtp15,DT$SEX),mean)       #correct average

DT[,mean(pwgtp15),by=SEX]             #correct average

mean(DT$pwgtp15,by=DT$SEX)            #incorrect average

mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15) # wrong syntax

rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2] #wrong syntax

system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(DT[,mean(pwgtp15),by=SEX]) #fastest 
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))