url_sax <- "https://sax.co.uk/collections/alto-saxophones"

sax_name <- url_sax %>%
  read_html() %>%
  html_elements("div.product-block__title") %>%
  html_text2()


euro_price <- url_sax %>%
  read_html() %>%
  html_elements("span.product-price__item.product-price__amount.theme-money") %>%
  html_text2() %>%
  parse_number()

euro_price

sax_df <- data.frame(sax_name, euro_price)

View(sax_df)
