library(party)

# import the data to a variable

data<-Cardiotocographic

# information about the data
str(data)

# covert the numerical type to categorical type
data$cat_NSP<- factor(data$NSP)
data$cat_NSP


# data partition into training and testing data set

set.seed(1234)
splt<- sample(2,nrow(data),replace = TRUE,prob = c(0.07,0.03))
train<- data[splt==1,] # 1480 rows
test<- data[splt==2,] # 560 rows



# creating a decision tree
Dtree<- ctree(cat_NSP~LB+AC+UC, data = train)
Dtree

plot(Dtree)


## minsplit the data  400
Dtree1<- ctree(cat_NSP~LB+AC+UC, data = train, controls = ctree_control(mincriterion = 0.99, minsplit = 900))
Dtree1
plot(Dtree1)

## minsplit the data  900
Dtree1<- ctree(cat_NSP~LB+AC+UC, data = train, controls = ctree_control(mincriterion = 0.99, minsplit = 900))
Dtree1
plot(Dtree1)


## predition of validation
pred<- predict(Dtree, train )

prob[300:450]<- predict(Dtree, train ,type ='prob')

## missclassification  error in training data set

tab<- table(predict(Dtree),train$cat_NSP)
print(tab)
1-sum(diag(tab))/sum(tab)

## missclasification error for testing data set 
pred<- predict(Dtree,newdata = test)
tab<- table(pred,test$cat_NSP)
print(tab)
1-sum(diag(tab))/sum(tab)

