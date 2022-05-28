#required libraries robotstxt,rvest
library(robotstxt)
library(rvest)

#SCRAPPING WEBSITE
link<-'https://www.amazon.in/s?bbn=976419031&rh=n%3A976419031%2Cp_89%3AOnePlus&dc&qid=1653641120&rnid=3837712031&ref=lp_976420031_nr_p_89_0'

#read url
page<-read_html(link)

#segregating data
name<-page%>%html_nodes(".a-size-base-plus")%>%html_text()

price<-page%>%html_nodes(".a-price-whole")%>%html_text()

rating<-page%>%html_nodes(".aok-align-bottom")%>%html_text()

#create  a table 
product_reviews=data.frame(name,price,rating)

#write data into excel sheet
write.csv(product_reviews,"product_reviews.csv")

#view data of products
View(product_reviews)