



#' @rdname spice-class
#' @param object see **Usage**
#' @export
setMethod(f = show, signature = 'spice', definition = \(object) {
  object |> 
    format.spice() |> 
    cat()
})  


