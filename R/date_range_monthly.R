#' Create a range of monthly dates in the `yyyy-mm` format 
#'
#' @param
#' @keywords
#' @export
#' @example
#' format_month()
date_range_monthly <- function(.start, .end) {
  range_vector <- seq(.start, .end, by = "months")
  range_vector %>%
    map_chr(., ~ str_glue("{year(.x)}-{format_month(.x)}"))
}

format_month <- function(.x) {
  return(
    if_else(
      str_length(month(.x)) == 1, 
      paste("0", month(.x), sep = ""), 
      paste(month(.x))) 
  )
}

