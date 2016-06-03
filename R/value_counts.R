#' A Quick Group-by, Summarise, Mutate function inspired by Pandas
#'
#' This function allows you to select one or more variables from a data frame
#' and have a group_by(), summarise with n(), and mutate() a percent variable.
#' Since it uses dplyr, it returns a data frame, which is easier to plot with.
#' @param
#' @keywords
#' @export
#' @example
#' value_counts()
value_counts <- function(df, ...) {
  value_counts_(df, .dots = lazyeval::lazy_dots(...))
}

value_counts_ <- function(df, ..., .dots) {
  dots <- lazyeval::all_dots(.dots, ..., all_named = TRUE)
  df <- dplyr::group_by_(df, .dots = dots)
  df <- dplyr::summarise(df, n = n())
  df <- dplyr::mutate(df, percent = round(n / sum(n) * 100, 2))
  df <- dplyr::arrange(df, desc(n))
  return(df)
}
