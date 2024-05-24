library(dplyr)
library(ggplot2)
View(starwars)

# Scenario 1: Bar Charts
## https://r-graph-gallery.com/barplot.html to here - https://r-graph-gallery.com/218-basic-barplots-with-ggplot2.html#horiz

ggplot(starwars,aes(x=species))+
  geom_bar()+
  coord_flip()

## how do I re-order these - https://r-graph-gallery.com/267-reorder-a-variable-in-ggplot2.html (Method 1) & remove NAs

swcount = starwars %>% 
  count(species) # setting up custom df to make this easier by having the count(n) to call in fct_reorder()

swcount %>%
  filter(!is.na(species)) %>% 
  mutate(species = fct_reorder(species, n)) %>%
  ggplot( aes(x=n, y=species)) +
  geom_bar(stat="identity") +
  xlab("count")

# Scenario 2: Box Plots
## https://r-graph-gallery.com/boxplot

starwars %>%
  filter(!is.na(birth_year), !is.na(homeworld)) %>%
  ggplot(aes(x = homeworld, y = birth_year)) +
  geom_boxplot() + 
  coord_flip()

# Scenario 3: Density Plots
## https://r-graph-gallery.com/density-plot

starwars %>% 
  ggplot(aes(x=height))+
  geom_density(fill="blue",alpha=0.7)

## adding theme discussed on page
library(hrbrthemes)

starwars %>% 
  ggplot(aes(x=height))+
  geom_density(fill="blue",alpha=0.7)+
  theme_ipsum()


