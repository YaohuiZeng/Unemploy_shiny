# plot_map.R

plot_map <- function(choropleth, state_df, month, range) {
    chor.sub <- subset(choropleth, 
                       period == month & (rate >= range[1] & rate <= range[2]))

    ggplot(chor.sub, aes(x=long, y=lat, group=group, fill=rate)) + 
        geom_polygon()+coord_map() +
        geom_polygon(data = state_df, colour = "black", fill = NA) +
        scale_fill_gradientn(colours=topo.colors(10))
}

