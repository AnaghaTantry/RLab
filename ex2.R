# Load necessary libraries
library(rvest)

# Specify the URL of the website to scrape
url <- "https://en.m.wikipedia.org/wiki/List_of_countries_and_dependencies_and_their_capitals_in_native_languages"

# Download the HTML content
html_content <- read_html(url)

# Define XPath selectors to extract data
title_xpath <- "//*[@id='content-collapsible-block-0']/table/tbody/tr/td[1]"
price_xpath <- "/*[@id='content-collapsible-block-0']/table/tbody/tr/td[2]"

# Extract data using XPath selectors
titles <- html_content %>%
  html_nodes(xpath = title_xpath) %>%
  html_text() %>%
  trimws() # Remove leading/trailing whitespaces
prices <- html_content %>%
  html_nodes(xpath = price_xpath) %>%
  html_text() %>%
  trimws() # Remove leading/trailing whitespaces

# Combine the extracted data into a data frame
book_data <- data.frame(Title = titles, Price = prices)

# Print the extracted data
print(book_data)

# Save the extracted data to a CSV file
write.csv(book_data, "book_data.csv", row.names = FALSE)


