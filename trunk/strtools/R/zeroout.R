REzeroout <-
function (x, replaceby = "", ...) 
{
    x <- unlist(sapply(x, function(z) gsub("?([.][0])", replaceby, 
        z)))
    return(x)
}
