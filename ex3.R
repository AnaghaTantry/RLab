#Load the necessary libraries
library(rvest)
#Specify the URL of the web to scrape
url <- "https://books.toscrape.com/"
#Download the HTML content
html_content <- read_html(url)
#Define X Path selectors to extract data
title_XPath <- '//*[@id="default"]/div/div/div/div/section/div[2]/ol/li/article/h3'
price_XPath <- '//*[@id="default"]/div/div/div/div/section/div[2]/ol/li/article/div[2]/p[1]'
#Extract data using X Path selectors
titles <- html_content %>%
  html_nodes(xpath = title_XPath) %>%
  html_text() %>%
  trimws()
prices <- html_content %>%
  html_nodes(xpath = price_XPath) %>%
  html_text() %>%
  trimws()
#Combine the extracted data into a data frame
book_data = data.frame(Title = titles, Price = prices)
#Print the extracted data
print(book_data)
#Save the extracted data to a CSV file
write.csv(book_data, "book_data.csv",row.names = FALSE)
  
