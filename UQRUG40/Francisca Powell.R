# we recommend running this is a fresh R session or restarting your current session
install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))
library(cmdstanr)
library(brms)

b <- c(2, 0.75)
x <- rnorm(100)
y <- rnorm(100,mean = b[1] * exp(b[2] * x))
dat1 <- data.frame(x, y)

prior1 <- prior(norm(1,2), nlpar = "b1") +
  prior(normal(0,2), nlpar = "b2")

fit1 <- brm(bf(y ~ b1 * exp(b2 * x), b1 + b2 ~ 1, n1= TRUE),
            data = dat1, prior = prior1)
