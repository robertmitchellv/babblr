#' A function for quickly returning a properly formatted stubtitle to use in
#' ggplot2's lab() function
#'
#' This function takes two arguments: a string and a numeric.  The string is
#' the subtitle previously assigned as a variable before runnig the function.
#' the numeric will determin where the line breaks occur in your subtitle
#' string.
#' @param
#' @keywords
#' @export
#' @example
#' subtitle_format()
subtitle_format <- function (string, margin) {
  subtitle <- paste0(strwrap(string, margin), sep = "", collapse = "\n")
  return(subtitle)
}

# In order for the plot to render correctly, the plot title and subtitle should
# be set
style_title <- theme(plot.title=element_text(face="bold", size = 18)) +
               theme(plot.subtitle=element_text(margin=margin(b=15)))
