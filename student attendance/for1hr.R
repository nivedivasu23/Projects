library(dplyr)
getwd()
data<-read.csv(file.choose(),header = TRUE)
data
name<- unique(data$name)
name


#to find  duration using professor time
pname = "Dr. C. Narendra Babu"
pdata = filter(data , name == pname )
pdata
pdata1 = filter(pdata , action == "Joined" )
pdata2 =filter(pdata , action == "Left" )

ptime1<-strptime(pdata1$time_stamp,format="%d/%m/%Y,%H:%M:%S") 
ptime1
ptime2<-strptime(pdata2$time_stamp,format="%d/%m/%Y,%H:%M:%S")
ptime2

t1<- ptime2 - ptime1
t1
duration<- replicate(length(name),t1)

# binding duration with names
df= data.frame(name,duration)
df


# to find the presence time 
data1 = filter(data , action == "Joined" )
data2 =filter(data , action == "Left" ) 
time1<-strptime(data1$time_stamp,format="%d/%m/%Y,%H:%M:%S") 
time2<-strptime(data2$time_stamp,format="%d/%m/%Y,%H:%M:%S")
presence<- time2-time1
presence
dataFrame <- data.frame( name , duration, presence)
dataFrame


ni <- length(name)

# calculating the half time of duration 
di<-(t1)/2
di
pi<-(dataFrame$presence)

# for assigning 1 or zero based on presence time
for(i in 1:ni ){
  if(pi[i] >= di+5.00 || pi[i] >= di-5.00){
    attendance[i] <- 1
  }else{
    attendance[i]<- 0
  }
}
attendance
dataFrame = cbind(dataFrame , attendance )
dataFrame


#write.csv(dataFrame, "G:/RUAS DATA SCIENCE/data mining assignmnent/AssignmentSolution/MY_SOLUTION/modi_day2.csv")

