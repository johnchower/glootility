
gloo_colors <- c(
green = "#71bf44"
, blue = "#1fbdd6"
, gray = "#888888"
, yellow = "#eeb21e"
, red = "#F90005"
)

devtools::use_data(gloo_colors, gloo_colors, overwrite = T)

test_data_tufte_chart <- data.frame(
  x = c('bar1', 'bar2', 'bar3')
  , y = 1:3
)

test_data_grouped_tufte_chart <- data.frame(
  x = rep(c('bar1', 'bar2', 'bar3'), times = 2)
  , g = rep(c('group1', 'group2'), each = 3)
  , y = 1:6
)

glootility::tufte_grouped_bar_chart(
  test_data_grouped_tufte_chart
  , ybreaks = 1:6
  , x_var = 'x'
  , y_var = 'y'
  , group = 'g'
)

