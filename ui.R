install.packages("shiny")
library(shiny)
shinyUI(fluidPage(
  titlePanel("Bollywood Actor Data"),
  sidebarPanel(
    selectInput("var","Select any entity from dataset" ,choices = c("actorName"=1,"movieCount"=2,"ratingSum"=3,"normalizedMovieRank"=4,"googleHits"=5,"normalizedGoogleRank"=6, "normalizedRating"=7),selected = 1),
    br(),
    radioButtons("color","select colour of graph", choices=c("blue","green","yellow"),selected="blue")
  ),
 
  mainPanel(
    tabsetPanel(type = "tab",
                tabPanel("Summary",verbatimTextOutput("sum")),
                tabPanel("Structure",verbatimTextOutput("str")),
                tabPanel("Dataset",tableOutput("data")),
                tabPanel("Plot", plotOutput("myplot"))
    ) 
  ),
  
  #slidebar for taking rank of actor
  
  sidebarPanel(
    textInput(inputId="var1", label = "Enter the Rank of the Actor"),
     br()
  ),
  
  # main panel for actor data display
  
  mainPanel(
    tabsetPanel(type = "tab",
                tabPanel("Actor Details",tableOutput("data1"))
                
                
    ) 
  ),
  
  #button to execute graphs
  
  
  sidebarPanel(
   # actionButton("var2", "LINEAR REGRESSION"),
    selectInput("var2","Select a Method" ,choices = c("Linear Regression"=1,"Naive Bayes"=2),selected = 1),
    br()
  ),
  
  #main panel for regression
  
  
  mainPanel(
    tabsetPanel(type = "tab",
                tabPanel("Plot",plotOutput("data2"))
                
                
    ) 
  )
  
)
)


