#' A Summary statistic that returns results in a data frame
#'
#' This function will compute summary statistics on all numeric values of
#' a dataframe and will return a dataframe.  You can also specify one or
#' more variables to compute only a handful of summary statistics.
#'
#' @param
#' @keywords
#' @export
#' @example
#' describe
describe <- function(data, ...) {
  vars <- quos(...)
  funs <- list(
    min = min, sd = sd, iqr = IQR,
    mad = mad, mean = mean, max = max
  )
  args <- list(
    list(na.rm = TRUE)
  )

  if (length(vars) >= 1) {
    data <- data %>% select(!!! vars)
  } else if (length(vars) == 0) {
    data <- data %>% keep(is.numeric)
  }

  data %>%
    map_df(
      ~invoke_map_df(funs, args, .), .id = "variable"
    )
}
