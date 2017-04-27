library(shiny)

shinyServer(function(input, output) {
  
  
  dataInput <- reactive({
  })
  
  output$myChart1 <- renderChart2({
    
    if(!grepl(input$country,"All"))
      df <- df[which(df$Country==input$country),]
    if(!grepl(input$purpose,"All"))
      df <- df[which(df$Purpose==input$purpose),]
    if(!grepl(input$category,"All"))
      df <- df[which(df$Item_category==input$category),]
    
    if(grepl(input$group,"Gender")){
      dfM <- df[which(df$Gender=="Male"),]
      dfF <- df[which(df$Gender=="Female"),]
      
      x <- cbind(aggregate(dfM$Amount, by=list(Category=dfM$month), FUN=sum),"Male")
      colnames(x) <- c("Category","x","Gender")
      y <- cbind(aggregate(dfF$Amount, by=list(Category=dfF$month), FUN=sum),"Female")
      colnames(y) <- c("Category","x","Gender")
      
      data <- rbind(x,y)
      data <- data[order(match(data[,1], month.abb)), ]
      p1 <- nPlot(x ~ Category, data, group = c("Gender"), type = 'multiBarChart')
    }else if(grepl(input$group,"Education")){
      dfM <- df[which(df$Education=="Secondary"),]
      dfF <- df[which(df$Education=="Primary"),]
      
      x <- cbind(aggregate(dfM$Amount, by=list(Category=dfM$month), FUN=sum),"Secondary")
      colnames(x) <- c("Category","x","Education")
      y <- cbind(aggregate(dfF$Amount, by=list(Category=dfF$month), FUN=sum),"Primary")
      colnames(y) <- c("Category","x","Education")
      
      data <- rbind(x,y)
      data <- data[order(match(data[,1], month.abb)), ]
      p1 <- nPlot(x ~ Category, data, group = c("Education"), type = 'multiBarChart')
      
    }else if(grepl(input$group,"Type")){
      dfM <- df[which(df$Type=="Inflow"),]
      dfF <- df[which(df$Type=="Outflow"),]
      
      x <- cbind(aggregate(dfM$Amount, by=list(Category=dfM$month), FUN=sum),"Inflow")
      colnames(x) <- c("Category","x","Type")
      y <- cbind(aggregate(dfF$Amount, by=list(Category=dfF$month), FUN=sum),"Outflow")
      colnames(y) <- c("Category","x","Type")
      
      data <- rbind(x,y )
      data <- data[order(match(data[,1], month.abb)), ]
      p1 <- nPlot(x ~ Category, data, group = c("Type"), type = 'multiBarChart')
      }else {
      
      
      data <- aggregate(df$Amount, by=list(Category=df$month), FUN=sum)
      data <- data[order(match(data[,1], month.abb)), ]
      p1 <- nPlot(x ~ Category, data, type = 'multiBarChart')
      p1$xAxis(staggerLabels = TRUE)
    }
    return(p1)
  })
})

