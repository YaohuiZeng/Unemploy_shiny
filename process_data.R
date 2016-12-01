## process data
## setwd('~/R Project/Computer_intensive/HW4/')
load('unemp_app.RData')
library(maps)
library(RColorBrewer)
library(choroplethr)
library(ggmap)
library(ggplot2)
library(scales)
unemp <- dat
names(unemp) <- c("id", "state_fips", "county_fips", "name", "period", 
                  "labor", "employed", "unemployed", "rate")
unemp$county <- tolower(gsub(" County, [A-Z]{2}", "", unemp$name))
unemp$state <- gsub("^.*([A-Z]{2}).*$", "\\1", unemp$name)
county_df <- map_data("county")
names(county_df) <- c("long", "lat", "group", "order", "state_name", "county")
county_df$state <- state.abb[match(county_df$state_name, tolower(state.name))]
county_df$state_name <- NULL

state_df <- map_data("state")
# Combine together 
choropleth <- merge(county_df, unemp, by = c("state", "county"))
choropleth <- choropleth[order(choropleth$order), ]
choropleth$period <- as.factor(choropleth$period)
choropleth$rate_d <- cut(choropleth$rate, breaks = c(seq(0, 10, by = 2), 35))

save(choropleth, state_df, county_df, file = 'unemp_app.RData')
