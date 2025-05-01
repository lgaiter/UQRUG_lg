library(visdat)
library(plotly)

vis_dat(airquality)

vis_expect(airquality, ~.x >= 25)
