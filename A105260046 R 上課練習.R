title: "Untitled"
author: "jerry lin"
date: "2018|~9??e28??e"
output: html_document
---
  
  
  ---
  title: "homework"
author: "jerry lin"
date: "2018|~9??e28??e"
output: html_document
---
  
  
  knitr::opts_chunk$set(
    echo = FALSE,          # don't show code
    warning = FALSE,       # don't show warnings
    message = FALSE,       # don't show messages (less serious warnings)
    cache = FALSE,         # set to TRUE to save results from last compilation
    fig.align = "center"   # center figures
  )


library(tidyverse)       # load libraries you always use here
library(tidymodels)
# library(hayeslib)      # i highly recommend creating a personal R package
# with code you use a lot and loading it here as well


set.seed(27)             # make random results reproducible


fit <- lm(hp ~ ., mtcars)
au <- broom::augment(fit)


au %>% 
  gather(x, val, -contains(".")) %>% 
  ggplot(aes(val, .resid)) + 
  geom_point() + 
  facet_wrap(~x, scales = "free")

knitr::kable(head(select(au, 1:5)))

# this R markdown chunk generates a code appendix

