options(repos=structure(c(CRAN="https://cran.revolutionanalytics.com/")))


q <- function (save="yes", ...) {
    print ('see you soon')
    savehistory("~/.Rhistory")
    quit(save=save, ...)
}

.Last <- function(){
    if(interactive()) utils::savehistory("~/.Rhistory")
}
    
.First <- function(){
    if(interactive()) utils::loadhistory("~/.Rhistory")
}
