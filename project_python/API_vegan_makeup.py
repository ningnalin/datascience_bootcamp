import pandas as pd
import requests

# 1. url (product tags = vegan)
url = "http://makeup-api.herokuapp.com/api/v1/products.json?product_tags=vegan"

# 2. get url
result = requests.get(url)

# 3. convert to json (for easy usage)
result_json = result.json()

# select column
df = pd.DataFrame(result_json)[["brand","name", "price", "category", "product_type", "rating", "tag_list"]]
df
