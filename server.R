library(shiny)
shinyServer(
  function(input,output){
    #data<-read.csv(file.choose(),header = TRUE)
    data<-read.csv("C:/Users/Dell/Documents/BollywoodActorRanking2.csv")
    output$sum <- renderPrint({
      summary(data)
      
    })
    output$str <- renderPrint({
      str(data)
      
    })
    output$data <- renderTable({
      colm <- as.numeric(input$var)
      data[colm]
      
    })
    
    
   output$myplot <- renderPlot({
     colm <- as.numeric(input$var)
      
    plot(data[,colm],col=input$color) 
   })
   
   #display rank of actor 
   
   output$data1 <- renderTable({
     row <- as.numeric(input$var1)
     data[row,]
    
   })
   
   #Display plot of linear regression
   
   output$data2 <- renderPlot({
     
     x <- as.numeric(input$var2)
     
     #to check what user wants to plot
     
     if(x==1)
     {
     set.seed(0)
     sample <- sample(nrow(data),0.7*nrow(data))
     train <- data[sample,]
     test <- data[-sample,]
     
     model <- lm(data$normalizedRating~data$actorName+data$movieCount+data$ratingSum+data$normalizedMovieRank+data$googleHits+data$normalizedGoogleRank)
     
     pred <- predict(model,newdata = test)
     plot(test$normalizedRating,type="l",lty=1.8,col="red")
     lines(pred,type="l",col="blue")
     }
     else
     {
       library(e1071)
       model2 <- naiveBayes(as.factor(d$normalizedRating)~d$actorName+d$movieCount+d$ratingSum+d$normalizedMovieRank+d$googleHits+d$normalizedGoogleRank,data=d)
       pred2 <- predict(model2,test)
       plot(test$normalizedRating,type="l",lty=1.8,col="red")
       lines(pred2,type="l",col="blue")
       
       
     }
     
   })
   
  }
)




