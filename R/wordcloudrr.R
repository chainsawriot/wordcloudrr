#' @import jsonlite

export_data <- function(wordcloudrr_list) {
    data <- jsonlite::toJSON(wordcloudrr_list)
    paste0("var data = '", data, "';")
}

gen_canvas <- function(width = 800, height = 800) {
    x <- readLines(system.file("lib","wordcloudrr.html", package = "wordcloudrr"))
    x <- gsub("##width##", width, x)
    x <- gsub("##height##", height, x)
    return(x)
}
#words <- c('中文', 'ngramrr', 'chainsawriot', 'weiborr', 'hkgovrr', 'xx')
#freq <- c(150, 80, 50,100, 20, 10)
#cols <- c("#FF0000", "#FF0000", "#FF0000", "#00FF00", "#00FF00", "#0000FF")

#' Generate javascript wordcloud
#'
#' A drop-in replacement for wordcloud() to generate javascript wordcloud.
#'
#' @param words character vector of words to be plotted
#' @param freq numeric vector of word frequency
#' @param cols character vector of HTML RGB codes
#' @param shape Shape of wordcloud, "circle", "triangle", "star"
#' @param dir character, path to export the wordcloud, NULL is temp. dir
#' @param width numeric, width of the wordcloud
#' @param height numeric, height of the wordcloud
#' @return Nothing
#' @author Chung-hong Chan <chainsawtiney@gmail.com>, with wordcloud2.js written by timedream and TaffyDB.
#' @examples
#' \dontrun{
#' words <- c("hello", 'ngramrr', 'chainsawriot', 'weiborr', 'hkgovrr', 'xx')
#' freq <- c(150, 80, 50,100, 20, 10)
#' cols <- c("#FF0000", "#FF0000", "#FF0000", "#00FF00", "#00FF00", "#0000FF")
#' wordcloudrr(words, freq, cols)
#' }
#' @export
wordcloudrr <- function(words, freq, cols = '#000000', shape = 'circle', dir = NULL, width = 800, height = 800) {
    js_data <- export_data(list(data = data.frame(words = words, freq = freq, cols = cols), shape = shape))
    if (is.null(dir)) {
        dir <- tempdir()
    }
    file.copy(system.file("lib", "layout.js", package = "wordcloudrr"), dir, overwrite = TRUE)
    file.copy(system.file("lib", "taffy-min.js", package = "wordcloudrr") , dir, overwrite = TRUE)
    file.copy(system.file("lib", "wordcloud2.js", package = "wordcloudrr"), dir, overwrite = TRUE)
    writeLines(js_data, paste0(dir, "/wordcloudrrdata.js"))
    writeLines(gen_canvas(width, height), paste0(dir, "/index.html"))    
    browseURL(paste0("file://", dir, "/index.html"))
}

#wordcloudrr(words, freq, cols = cols, shape = 'triangle')
#x <- readLines("../inst/lib/wordcloudrr.html")
#gsub("##width##", "500", x)
