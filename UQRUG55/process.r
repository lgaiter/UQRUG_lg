# Load necessary library
library(dplyr)

# Sample data frame
df <- data.frame(
    t = 1:100,
    n = cumsum(runif(100, min = 0, max = 50))
)

# Find the first observation where 'n' crosses the threshold of 1000
threshold <- 1000
first_crossing <- df %>%
    filter(n > threshold) %>%
    slice(1)

print(first_crossing)
