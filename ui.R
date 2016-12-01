# ui.R
shinyUI(fluidPage(
    titlePanel("Unemployment Rate"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Unemployment rate at the county level in 
                     United States from Nov. 2013 to Dec. 2014"),  
            
            selectInput("var", 
                        label = "Choose a month",
                        choices = c(
                            'Nov-13',
                            'Dec-13',
                            'Jan-14',
                            'Feb-14',
                            'Mar-14',
                            'Apr-14',
                            'May-14',
                            'Jun-14',
                            'Jul-14',
                            'Aug-14',
                            'Sep-14',
                            'Oct-14',
                            'Nov-14',
                            'Dec-14(p)'
                            ),
                        selected = "Nov-13"),
            
            sliderInput("range", 
                        label = "Range of unemployment rate:",
                        min = 0, max = 30, value = c(0, 30))
        ),
        
        mainPanel(plotOutput("map"))
    )
))