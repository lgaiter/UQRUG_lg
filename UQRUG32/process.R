library(tidyverse)
library(readxl)

trial <- read_excel("kar.xlsx")
# Data transformation
df <- trial %>% 
  pivot_longer(c(2:3), names_to = "events", values_to = "review") %>% 
  count(events, review) %>% 
  # rbind(tibble(events = c("eventA review", "eventA review"),
               # review = c("bad", "very bad"),
               # n = c(NA, NA))) %>%
  mutate(events = as.factor(events),
         review = as.factor(review))

# plot
df %>% ggplot(aes(y = review, x = n, fill = events)) +
  geom_col(width = 0.5) +
  facet_wrap(~events, scales = "free") +
  theme(legend.position = "none") +
  scale_y_discrete(limits = c("very good", "good", "neutral", "bad", "very bad"), drop = FALSE)

df %>% ggplot()+
  geom_bar(aes(x = reorder(events,n), y=n, fill=review), position="stack", stat="identity")+
  coord_flip() + 
  xlab("Event name")+
  scale_fill_brewer(palette="PRGn")+
  theme(legend.position="bottom") +
  scale_y_discrete(limits = c("very good", "good", "neutral", "bad", "very bad"), drop = FALSE)
