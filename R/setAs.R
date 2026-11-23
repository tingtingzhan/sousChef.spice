


setAs(from = 'character', to = 'spice', def = \(from) {
  
  ns <- asNamespace('sousChef.spice')
  
  if (!exists(from, where = ns)) return(from)
  
  eval(call(name = from), envir = ns)
  
})