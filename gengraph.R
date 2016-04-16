## 1. create temp dir
## 2. formating everything in R, export formating.json
## 3. copy wordcloud.js, layout.js and formating.json to temp dir
## 4. open temp dir in browser

export_data <- function(wordcloudrr_list) {
    data <- jsonlite::toJSON(wordcloudrr_list)
    paste0("var data = '", data, "';")
}

js_data <- export_data(list(data = data.frame(word = c('wordcloudrr', 'ngramrr', 'chainsawriot', 'weiborr', 'hkgovrr'), size = c(200, 80, 50,100, 20)), shape = 'circle'))

x <- tempdir()
file.copy("wordcloudrr.html", x)
file.copy("layout.js", x)
file.copy("wordcloud2.js", x)
writeLines(js_data, paste0(x, "/wordcloudrrdata.json"))
browseURL(paste0("file://", x, "/wordcloudrr.html"))

