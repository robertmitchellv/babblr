#' A Quick Group-by, Summarise, Mutate function inspired by Pandas
#'
#' This function allows you to select one or more variables from a data frame
#' to perform (1st) a group_by() operation, (2nd) a summarise() count operation
#' with n(), and (3rd) then mutate() operation to create a percent variable.
#' Since it uses dplyr, it returns a data frame, which is easier to plot with.
#' @param
#' @keywords
#' @export
#' @example
#' value_counts()
value_counts <- function(data, ..., round = FALSE, arrange = FALSE) {
  group_by <- quos(...)

  out <- data %>%
    group_by(!!! group_by) %>%
    summarise(n = n())

  if (round == TRUE) {
    out <- out %>%
      mutate(percent = round_percent(n))
  } else {
    out <- out %>%
      mutate(percent = round(
        (n / sum(n)) * 100,
        2
      ))
  }
  
  ungroup(out)

  if (arrange == TRUE) {
    out %>%
      arrange(desc(n))
  } else {
    return(out)
  }
}

# round percentage so it adds to 100
round_percent <- function(x) {
  x <- x / sum(x) * 100     # Standardize result
  res <- floor(x)           # Find integer bits
  rsum <- sum(res)          # Find out how much we are missing
  if(rsum < 100) {
    # Distribute points based on remainders and a random tie breaker
    o <- order(x %% 1, sample(length(x)), decreasing = TRUE)
    res[o[1:(100 - rsum)]] <- res[o[1:(100 - rsum)]] + 1
  }
  res
}
