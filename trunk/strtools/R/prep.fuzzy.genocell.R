prep.fuzzy.genocell <-
function (x, ...) 
{
    if (!inherits(x, "genocell")) 
        stop("non convenient argument")
    prep.fuzzy.var(x, attributes(x)$bloc, ...)
}
