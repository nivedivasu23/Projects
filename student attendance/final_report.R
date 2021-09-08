getwd()
data<-read.csv(file.choose(),header = TRUE)
n<-length(data$ï..name)
sum<-replicate(length(data$ï..name),0)
perc<-replicate(length(data$ï..name),0)
report<-replicate(length(data$ï..name),0)
div<-replicate(length(data$ï..name),0)

dat<-data[2:7]
dat
data
# finding number of classes taken by organizer
pname = "Dr. C. Narendra Babu"
pdata = filter(data , name == pname )
pdata
total_days<-rowSums(pdata[2:7],na.rm =  TRUE)
total_days


# finding total days each student present
sum<-rowSums(dat,na.rm =  TRUE)

# finding percentage for each student

 for(i in 1:n){
   div[i]<-(sum[i]/total_days)
   perc[i]<-trunc(div[i]*100)
   
 }

perc
data<-cbind(data,perc)
data

# based on percentage allocate report

for(i in 1:n){
  if(perc[i] >= 85.00){
    report[i]="promoted"
  }else if(perc[i] >=75.00 ){
    report[i]="not promoted but condonable"
  }else{
    report[i] ="not condonable"
  }
  
}

data<-cbind(data, sum,perc,report)
data
data<-data[-1,]
data
write.csv(data,"G:/RUAS DATA SCIENCE/data mining assignmnent/AssignmentSolution/MY_SOLUTION/list_final.csv")

# graph plot for the data calculated
grp<-data$sum

dotchart(data$perc ,labels = data$ï..name, group=grp, main="student_report",xlab="percentage",ylab="names", lcolor = 'blue', pch = 19  ,cex =1)
?dotchart




