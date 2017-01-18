# Functions and data for creating graphs

#' Gloo color palette
#' 
#' A named vector containing hex codes for the Gloo logo's colors

"gloo_colors"

#' Create a Tufte-style bar chart
#'
#' @param df A data frame containing the data to be plotted
#' @param ybreaks A vector determining where the y-axis breaks are.
#' @param x_var Character that names the column of df to be used for
#' the x variable.
#' @param y_var Character that names the column of df to be used for
#' the y variable.
#' @param ... Arguments to pass to scale_y_continuous
#' @param theme_tufte_opts Arguments to be passed to ggthemes::theme_tufte
#' @param geom_bar_opts Arguments to be passed to ggplot2::geom_bar
#' @return A ggplot object
#' @export

tufte_bar_chart <- function(df
                            , ybreaks=0
                            , x_var, y_var
                            , theme_tufte_opts = list(base_size = 36, ticks = T)
                            , geom_bar_opts = list(fill = "#888888", stat = "identity", width=.25)
                            , ...){
  ggplot2::ggplot(df, ggplot2::aes_string(x=x_var, y=y_var)) +
    do.call(ggthemes::theme_tufte, theme_tufte_opts) +
    do.call(ggplot2::geom_bar, geom_bar_opts) +
    ggplot2::scale_y_continuous(breaks=ybreaks,...) +
    ggplot2::geom_hline(yintercept=ybreaks, col="white", lwd=1) +
    ggplot2::theme(axis.title = ggplot2::element_blank())
}


#' Create a Tufte-style grouped bar chart
#'
#' @param df A data frame containing the data to be plotted
#' @param ybreaks A vector determining where the y-axis breaks are.
#' @param x_var Character that names the column of df to be used for
#' the x variable.
#' @param y_var Character that names the column of df to be used for
#' the y variable.
#' @param ... Arguments to pass to scale_y_continuous
#' @param group Character that determines which column of df to group by.
#' @param theme_tufte_opts Arguments to be passed to ggthemes::theme_tufte
#' @param geom_bar_opts Arguments to be passed to ggplot2::geom_bar
#' @return A ggplot object
#' @export

tufte_grouped_bar_chart <- function(df
                            , ybreaks=0
                            , x_var, y_var 
                            , group
                            , theme_tufte_opts = list(base_size = 36, ticks = T)
                            , geom_bar_opts = list(postition = "dodge", stat = "identity", width=.25)
                            , ...){
  ggplot2::ggplot(df, ggplot2::aes_string(x=x_var, y=y_var, fill = group)) +
    do.call(ggthemes::theme_tufte, theme_tufte_opts) +
    do.call(ggplot2::geom_bar, geom_bar_opts) +
    ggplot2::scale_fill_manual(
      values=c(glootility::gloo_colors[['gray']]
               , glootility::gloo_colors[['blue']])
    ) +
    ggplot2::labs(fill = "") +
    ggplot2::scale_y_continuous(breaks=ybreaks,...) +
    ggplot2::geom_hline(yintercept=ybreaks, col="white", lwd=1) +
    ggplot2::theme(axis.title = ggplot2::element_blank())
} 

