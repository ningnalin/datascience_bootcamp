## web scraping movie imdb

library(rvest)
library(tidyverse)

url <- "https://www.imdb.com/search/title/?groups=top_100&sort=user_rating,desc"

movie_name <- url %>%
  read_html() %>%
  html_elements("h3.lister-item-header") %>%
  html_text2()


rating <- url %>%
  read_html() %>%
  html_elements("div.ratings-imdb-rating") %>%
  html_text2() %>%
  as.numeric()

movie_year <- url %>%
  read_html() %>%
  html_elements("span.lister-item-year") %>%
  html_text2() %>%
  str_extract('\\d+') %>%
  as.numeric()

movie_lenght <- url %>%
  read_html() %>%
  html_elements("span.runtime") %>%
  html_text2() %>%
  str_extract('\\d+') %>%
  as.numeric()



movie_df <- data.frame(movie_name, movie_year, movie_lenght, rating)

View(movie_df)
