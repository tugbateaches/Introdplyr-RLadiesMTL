#gganimate example


library(ggplot2)
library(gganimate)
library(gapminder)


k <- gapminder %>% filter(continent != "Oceania")
k$continent <- as.character(k$continent)
k$continent[k$continent=="Americas"] <- "America"
k$continent <- as.factor(k$continent)
ggplot(k, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
   geom_point(alpha = 0.7, show.legend = FALSE) +
   scale_colour_manual(values = country_colors) + theme_bw(base_size=14) +
   scale_size(range = c(2, 12)) +
   scale_x_log10() +
   facet_wrap(~continent) +
   # Here comes the gganimate specific bits
   labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'Life expectancy') +
   transition_time(year) +
   ease_aes('linear')

anim_save("hello4.gif", fig.width=500, fig.height=500, units="in")