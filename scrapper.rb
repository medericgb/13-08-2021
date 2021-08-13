require "nokogiri"
require "open-uri"

website_url = "https://books.toscrape.com/catalogue/a-light-in-the-attic_1000/index.html"

def web_scrapper(url)
  html = open(url)
  doc = Nokogiri::HTML(html)

  hash = Hash.new

  title = doc.css('.product_main').css('h1').text
  price = doc.css('.price_color').text
  stock = doc.css('table tr').css('td')[5].text
  description = doc.css('.product_page').css('p')[3].text
  upc = doc.css('table tr').css('td')[0].text
  
  hash["title"] = title
  hash["price"] = price
  hash["stock"] = stock
  hash["description"] = description
  hash["upc"] = upc

  puts hash
end

web_scrapper(website_url)