create_wordcloud = function(word_column,
                            extra_stop = NULL,
                            min_freq = 2,
                            max_words =200,
                            random_order = FALSE,
                            rotation = 0.35,
                            colours = brewer.pal(8, "Dark2"),
                            wc_scale = c(3.5,0.25)) {
  #Create a vector containing only the text
  text = word_column
  # Create a corpus
  docs = Corpus(VectorSource(text))

  docs = docs %>%
    tm_map(removeNumbers) %>%
    tm_map(removePunctuation) %>%
    tm_map(stripWhitespace)
  docs = tm_map(docs, content_transformer(tolower))
  docs = tm_map(docs, removeWords, stopwords("english"))
  docs = tm_map(docs, removeWords, extra_stop)

  dtm = TermDocumentMatrix(docs)
  matrix = as.matrix(dtm)
  words = sort(rowSums(matrix),decreasing=TRUE)
  df = data.frame(word = names(words),freq=words)

  set.seed(1234) # for reproducibility
  wordcloud(words = df$word,
            freq = df$freq,
            min.freq = min_freq,
            max.words = max_words,
            random.order = random_order,
            rot.per = rotation,
            colors = colours,
            scale = wc_scale)
}




