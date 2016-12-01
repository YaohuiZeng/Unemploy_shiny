# servr.R
load('unemp_app.RData')
source("plot_map.R")

library(maps)
library(RColorBrewer)
library(choroplethr)
library(ggmap)
library(ggplot2)
library(scales)
library(shiny)

shinyServer(
    function(input, output) {
        output$map <- renderPlot({
            plot_map(choropleth, state_df, input$var, input$range)
        })
    }
)