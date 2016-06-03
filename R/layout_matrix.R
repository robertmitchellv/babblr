#' Layout matricies for the gridExtra package
#'
#' This code is used to supply the layout_matrix argument in the grid.arrange()
#' function so I don't have to keep retyping them.
#' @param
#' @keywords
#' @export
#' @example

one_by_one <- rbind(c(1, 1, 1, 1),
                    c(1, 1, 1, 1),
                    c(1, 1, 1, 1),
                    c(2, 2, 2, 2),
                    c(2, 2, 2, 2))

two_by_one <- rbind(c(1, 1, 2, 2),
                    c(1, 1, 2, 2),
                    c(1, 1, 2, 2),
                    c(3, 3, 3, 3),
                    c(3, 3, 3, 3))

two_by_none_wide_thin <- rbind(c(1, 1, 1, 2, 2),
                               c(1, 1, 1, 2, 2),
                               c(1, 1, 1, NA, NA),
                               c(1, 1, 1, NA, NA))

two_by_none_thin_wide <- rbind(c(1, 1, 2, 2, 2),
                               c(1, 1, 2, 2, 2),
                               c(1, 1, NA, NA, NA),
                               c(1, 1, NA, NA, NA),
                               c(1, 1, NA, NA, NA))
