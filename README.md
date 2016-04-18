# wordcloudrr
R to HTML5 wordcloud, with the goal to be a drop-in replacement for wordcloud::wordcloud().

## install

```{r}
require(devtools)
install_github("chainsawriot/wordcloudrr")
```
## usage

```{r}
require(wordcloudrr)
# minimal example
wordcloudrr(c('Hello World!'), c(100))
# useful example
words <- c("hello", 'ngramrr', 'chainsawriot', 'weiborr', 'hkgovrr', 'xx')
freq <- c(150, 80, 500,1000, 20, 10)
cols <- c('red', 'violet', 'tomato4', "wheat2", "seagreen", "royalblue")
wordcloudrr(words, freq, scale=c(0.3, 0.1), cols= cols, width = 1000, height = 1000)
# a practical example, modified from wordcloud::wordcloud()
require(tm)
require(RColorBrewer)

data(crude)
crude <- tm_map(crude, removePunctuation)
crude <- tm_map(crude, function(x)removeWords(x,stopwords()))
tdm <- TermDocumentMatrix(crude)
m <- as.matrix(tdm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
cc <- brewer.pal(5, "Greens")[factor(cut(d$freq, c(0 ,1, 5, 10, 30, Inf)))]
## the default auto_size is quite good already, you don't need to adjust the scale
wordcloudrr(d$word,d$freq,cols = cc, shape = "star", width = 800, height = 600)
```
