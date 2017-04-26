library(shiny)
shinyUI(fluidPage(
  
  sidebarPanel( width = 3,
                selectInput("country", "Country List:", choices = c("Burkina", "Senegal", "Uganda"),selected = ""),
                
                #selectInput("partner", "Partner List:", as.matrix(unique(data.frame("All",dfB$Partner.Name))),selected = ""),
                uiOutput("Box1"),                                            
                selectInput("type", "Package Type:", choices = c("All",
                                                                 "Propoor/Normal" = "typePN",
                                                                 "Flat/Proportional" ="typeFP",
                                                                 "Squeeze/bettone/limite"="typeSBL"))
                
                #textOutput("text")
  ),
  # Show a plot of the generated distribution
  mainPanel(
    tabsetPanel(
      
      tabPanel("Mean Difference",  
               showOutput("myChart1","nvd3")))
    
  )
  
))
