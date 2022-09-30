load_quotes = function() {
  return(yaml::read_yaml("quotes.yml")$quotes)
}

#* Generate a nugget of wisdom
#* @get /
generate_quote = function() {
  quotes = load_quotes()
  random_quote = sample(quotes, 1)[[1]]

  return(list(data = glue::glue("{random_quote$content} \n ---{random_quote$source}")))
}

