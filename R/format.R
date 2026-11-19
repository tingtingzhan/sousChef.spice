
#' @export
format.spice <- \(x, ...) {
  
  alias <- x@alias |>
    col_blue()
  
  name <- x@call |>
    as.character() |>
    col_br_magenta()
  
  paste0(alias, name)
  
}
