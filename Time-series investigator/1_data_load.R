## This part is responsible for loading data from different data sources
## Input - data sources
## Output - analytical datamart
## In The Example analytical datamart contains sales of grocery retailer 
## with attributes of SKUs and stores and has the next fileds:
## 
## date store sku sales name grp open_date square_trade square_total 

########################
## Load Original Data ##
########################

## Sales History
getwd()
sales.original <- read.csv('data\\sales.csv', 
                           header = T, sep = ';', dec = ',', encoding = 'UTF-8')
names(sales.original) <- c('date', 'store', 'sku', 'sales')
sales.original$date <- as.Date(sales.original$date)

## SKUs Hierarchy Information 
dictionary.article.original <- read.csv('D:\\Магнит\\Test DataSource\\art.csv',
                                        header = T, sep = ';', dec = ',', encoding = 'UTF-8')
names(dictionary.article.original) <- c('sku', 'name', 'grp')

## Stores Information
dictionary.store.original <- read.csv('D:\\Магнит\\Test DataSource\\store.csv',
                                      header = T, sep = ';', dec = ',', encoding = 'UTF-8')
names(dictionary.store.original) <- c('store', 'open_date', 'square_trade', 'square_total')
dictionary.store.original$open_date <- as.Date(dictionary.store.original$open_date)

## Join All To Analytical Datamart
sales.datamart <- left_join(sales.original, dictionary.article.original, by = 'sku')
sales.datamart <- left_join(sales.datamart, dictionary.store.original, by = 'store')

sales.datamart$store <- as.factor(sales.datamart$store)

## Result of this step is 
## sales.datamart









