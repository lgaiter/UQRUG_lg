library(tidyverse)



contour(volcano)
filled.contour(volcano)

vol <- volcano

ggplot(mtcars, mapping = aes(x = gear)) +
    geom_bar(just = 0)



ggplot(diamonds, aes(cut, price)) +
    geom_boxplot(outliers = FALSE, staplewidth = 0.5)


mtcars |> reframe(silly_mpg = matrix(mpg[1:4], nrow = 2),
    .by = gear)


