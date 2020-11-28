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
testmergep <- cbind(readtest1, readtest3)
testmerge <- cbind(testmergep, readtest2)
trainmergep <- cbind(readtrain1, readtrain3)
trainmerge <- cbind(trainmergep, readtrain2)
merged <- rbind(trainmerge, testmerge)
extracted <- merged[, c(1, 2, 3:8, 43:48, 83:87, 123:128, 163:168, 203, 204, 216, 217, 229, 230, 242, 243, 255, 256, 268:273, 347:352, 375:377, 426:431, 454:456, 505, 506, 518, 519, 531, 532, 541, 544, 545, 558:563)]
list <- c(1:6)
values <- c("walking", "walking upstairs", "walking downstairs", "sitting", "standing", "laying")
extracted[,2] <- mapvalues(extracted[,2], from = list, to = values)
colnames<-`(extracted, newcolumns)    
finalSubset <- aggregate(x = extracted,       
+           by = list(extracted$subjects),   
+           FUN = mean)