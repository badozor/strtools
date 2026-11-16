REbracketout <-
function (x, replaceby = "", ...) 
{
    x <- unlist(sapply(x, function(z) gsub("([(])|([)])", replaceby, 
        z)))
    return(x)
}
