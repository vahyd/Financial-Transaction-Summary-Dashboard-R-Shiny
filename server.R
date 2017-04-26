library(shiny)

shinyServer(function(input, output) {
  
  output$text <- renderText(
    paste(grepl(input$partner,"Kdg"))
  )
  dataInput <- reactive({
  })
  
  output$Box1 = renderUI({
    if(input$country == "Burkina")
      selectInput("partner", "Partner List:", as.matrix(unique(data.frame("All",dfB$Partner.Name))),selected = NULL)
    else if(input$country == "Senegal")
      selectInput("partner", "Partner List:", as.matrix(unique(data.frame("All",dfS$Partner.Name))),selected = NULL)
    else if(input$country == "Uganda")
      selectInput("partner", "Partner List:", as.matrix(unique(data.frame("All",dfU$Partner.Name))),selected = NULL)
  })
  
  output$myChart1 <- renderChart2({
    if(grepl(input$country,"Burkina"))
      data <-  mdfB
    else if(grepl(input$country,"Senegal"))
      data <-  mdfS
    else 
      data <-  mdfU
    if(grepl(input$partner,"All")){
      if(grepl(input$type,"All"))
        p1 <- nPlot(difference ~ village.code, data, group = c('partner'),
                    type = 'multiBarChart')
      else 
        p1 <- nPlot(difference ~ village.code, data,
                    group = input$type, type = 'multiBarChart')
    }else
      p1 <- nPlot(difference ~ village.code, data[which(data$partner==as.character(input$partner)),],
                  group = input$type, type = 'multiBarChart')
    return(p1)
  })
})

