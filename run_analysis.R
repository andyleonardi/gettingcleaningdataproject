## read the relevant data
featdata=read.table("features_info.txt")
subjtrain=read.table("./train/subject_train.txt")
colnames(subjtrain)="Sub.ID"
subjtest=read.table("./test/subject_test.txt")
colnames(subjtest)="Sub.ID"
xtrain=read.table("./train/X_train.txt")
ytrain=read.table("./train/y_train.txt")
xtest=read.table("./test/X_test.txt")
ytest=read.table("./test/y_test.txt")
colnames(ytrain)="Act.Label"
colnames(ytest)="Act.Label"
colnames(xtrain)=featinfo
colnames(xtest)=featinfo

## merging of data
xtraindat=data.frame(xtrain[,1:6],xtrain[,41:46],xtrain[,81:86],xtrain[,121:126],xtrain[,161:166],xtrain[,201:202],xtrain[,214:215],xtrain[,227:228],xtrain[,240:241],xtrain[,253:254],xtrain[,266:271],xtrain[,345:350],xtrain[,424:429],xtrain[,503:504],xtrain[,516:517],xtrain[,529:530],xtrain[,542:543])
xtestdat=data.frame(xtest[,1:6],xtest[,41:46],xtest[,81:86],xtest[,121:126],xtest[,161:166],xtest[,201:202],xtest[,214:215],xtest[,227:228],xtest[,240:241],xtest[,253:254],xtest[,266:271],xtest[,345:350],xtest[,424:429],xtest[,503:504],xtest[,516:517],xtest[,529:530],xtest[,542:543])
trainingdat=data.frame(subjtrain,ytrain,xtraindat)
testdat=data.frame(subjtest,ytest,xtestdat)
totaldat=rbind(trainingdat,testdat)

## creating the tidy data with averages of variables for each activity and subject
meltDat=melt(totaldat,id=c("Sub.ID","Act.Label"))
castDat=dcast(meltDat,Sub.ID+Act.Label~variable,mean)
write.table(castDat,file="GettingCleaningTidyDataproject.txt",row.names=FALSE)
