# cleaningDataCoursera
Final assignment from Coursera's course: getting and cleaning data

The following commands obtain data from the web, save them and make them readable by R
```{r}
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fpames=TRUE)
inertialtestdir = "UCI HAR Dataset/test/Inertial Signals"
inertialtraindir = "UCI HAR Dataset/train/Inertial Signals"
inertialtestfiles = list.files(path=inertialtestdir, pattern="*.txt", full.names=TRUE)
inertialtrainfiles = list.files(path=inertialtraindir, pattern="*.txt", full.names=TRUE)
readtrain1 <- read.table(trainfiles[1])
readtrain2 <- read.table(trainfiles[2])
readtrain3 <- read.table(trainfiles[3])
readtest1 <- read.table(testfiles[1])
readtest2 <- read.table(testfiles[2])
readtest3 <- read.table(testfiles[3])
```
Then the datasets were merged using cbind and rbind:
```{r}
testmergep <- cbind(readtest1, readtest3)
testmerge <- cbind(testmergep, readtest2)
trainmergep <- cbind(readtrain1, readtrain3)
trainmerge <- cbind(trainmergep, readtrain2)
merged <- rbind(trainmerge, testmerge)
```

The resulting data frame had 10299 observations of 563 variables.

To extract the columns with mean and standard deviation in their names, the following code was applied. Column numbers were identified by checking the descriptions in features.txt and adding 2 to compensate the merging of 'subject and 'y' files.
```{r}
extracted <- merged[, c(1, 2, 3:8, 43:48, 83:87, 123:128, 163:168, 203, 204, 216, 217, 229, 230, 242, 243, 255, 256, 268:273, 347:352, 375:377, 426:431, 454:456, 505, 506, 518, 519, 531, 532, 541, 544, 545, 558:563)]
```
To replace the indexes with descritive names for the activities in the data set, two vectors containing the indexes and the descriptive text were created and named 'list' and 'values', respectively. Information was obtained from activity_labels.txt. Then the replacement was made with 'mapvalues' function.
```{r}
list <- c(1:6)
values <- c("walking", "walking upstairs", "walking downstairs", "sitting", "standing", "laying")
extracted[,2] <- mapvalues(extracted[,2], from = list, to = values)
```
To change the column names with more descriptive expresions a vector called 'newcolumns' was created and later introduced to the extracted data frame with 'colnames' function.
```{r}
`colnames<-`(extracted, newcolumns)     #changes column names with those from newcolumns vector
```
Finally, the tidy data set with the average of each variable and subject was named "finalSubset" and it was obtained with the 'aggregate' function:
```{r}
finalSubset <- aggregate(x = extracted,       # Specify data 
+           by = list(extracted$subjects),    # Specify group indicator
+           FUN = mean)     #Specify function
```

