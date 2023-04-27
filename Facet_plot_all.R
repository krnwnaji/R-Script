library(readr)
library(tidyverse)
library(ggplot2)
library(plotly)

data <- read_csv("replace this with your file")
data[is.na(data)] <- 0
data_sum <- data %>%
  mutate(
    c_label = TP + FN,
    c_model = TP + FP,
    f1Cat = case_when(
      `F1 Score` < 0.85 ~ "<85",
      `F1 Score` >= 0.85 & `F1 Score` < 0.9  ~ "85-90",
      `F1 Score` >= 0.9 ~ ">90"
    )
  )

m <- data_sum %>%
  group_by(Petak) %>%
  nest() %>%
  # Fit linear model
  mutate(Mod = map(data, ~lm(c_model ~ c_label, data = .x))) %>%
  # Get the R2
  mutate(R2 = map_dbl(Mod, ~round(summary(.x)$r.squared, 3))) %>% 
  # get RMSE
  mutate(RMSE = map_dbl(Mod, ~round(sqrt(mean(summary(.x)$residuals^2)), 3)))
  # get mean F1 Score
  # mutate(F1_Ave = map(data, ))
m

# GGPlot all



# GGPlot facet
disp_ggp3 <- ggplot(
  data = data_sum, 
  mapping = aes(
      x = c_label, 
      y = c_model,
      col = data$`F1 Score`,
      facet = Petak,
      group = data$`Sampling Plot`
    )
  ) +
  geom_jitter()+
  labs(
    x = "Tree Label",
    y = "Tree Predicted",
    col = "F1 Score"
  ) +
  theme_minimal() +
  geom_label(
    data = m, 
    aes(
      x = Inf, 
      y = Inf, 
      label = paste("R2 = ",R2,sep = " ")
    ),
    hjust = 1, 
    vjust = 1
  ) +
  # stat_smooth(
  #   method = "lm",
  #   formula = y ~ x,
  #   se = FALSE
  # ) +
  geom_abline(
    intercept = 0,
    slope = 1, 
    col = "grey",
    linetype = "dashed"
  ) +
  facet_wrap(vars(Petak),ncol =5,scales = "fixed")

disp_ggp3
plotly::ggplotly(disp_ggp3)
