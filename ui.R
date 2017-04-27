library(shiny)
shinyUI(fluidPage(
  
  sidebarPanel( width = 3,
                selectInput("country", "Country List:", choices = c("All",levels(unique(df$Country))),selected = "All"),
                
                selectInput("purpose", "Purpose List:", choices = c("All","Business"="B","Home"="H"),selected = "All"),
                
                
                selectInput("category", "Item List:", choices = c("All",levels(unique(df$Item_category))),selected = "All"),
                
                
                radioButtons("group", "Group By",
                                   c("None","Type" = "Type",
                                     "Education" = "Education",
                                     "Gender" = "Gender"))           
                
  ),
  # Show a plot of the generated distribution
  mainPanel(
    tabsetPanel(
      
      tabPanel("Sum of Transactions",  
               showOutput("myChart1","nvd3")))
    
  )
  
))
