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
freq <- c(150, 80, 50,100, 20, 10)
cols <- c("#FF0000", "#FF0000", "#FF0000", "#00FF00", "#00FF00", "#0000FF")
wordcloudrr(words, freq, cols, width = 500, height = 400)
# a practical example, extracted from wordcloud::wordcloud()
require(tm)
data(crude)
crude <- tm_map(crude, removePunctuation)
crude <- tm_map(crude, function(x)removeWords(x,stopwords()))
tdm <- TermDocumentMatrix(crude)
m <- as.matrix(tdm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
wordcloud(d$word,d$freq)
```
