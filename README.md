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
```
