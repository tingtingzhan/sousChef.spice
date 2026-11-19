
#' @import methods
#' @import cli

setOldClass(Classes = c('cli_ansi_string', 'ansi_string', 'character'))



#' @title \linkS4class{spice}
#' 
#' @slot call \link[base]{name}, the function name to create this \linkS4class{spice}, which serves as the English name of the spice
#' 
#' @slot alias \link[cli]{ansi_string} or \link[base]{character} scalar, the name of spice in an alternative language
#' 
#' @export
setClass(Class = 'spice', slots = c(
  call = 'name',
  alias = 'character'
))






spice <- \(no_eval = sys_call_name(which = -2), ...) {
  
  no_eval
  
  x <- list(...)
  
  if (!length(x$call)) x$call <- call(name = 'quote', no_eval)
  
  if (!length(x$wiki)) {
    x$wiki <- no_eval |> 
      as.character()
  }
  
  if (!length(x$url)) {
    if (length(x$wiki)) {
      x$url <- x$wiki |>
        sprintf(fmt = 'https://en.wikipedia.org/wiki/%s')
      x$wiki <- NULL
    }
  }

  if (!length(x$alias)) stop('must provide `@alias`')
  
  if (!ansi_has_any(x$alias, link = TRUE)) {
    x$alias <- x$alias |>
      style_hyperlink(url = x$url)
    x$url <- NULL
  }
  
  c(list(Class = 'spice'), x) |> 
    do.call(what = 'new', args = _)
  
}







