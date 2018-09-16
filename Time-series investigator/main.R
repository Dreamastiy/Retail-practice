## Introduction
##
##
##
##
##
## Grouping features should be defiend as factors
## date column must exist
##


####################
## Load Libraries ##
####################

library(dplyr)
library(gWidgets2RGtk2)





sales.per.article <- sales.original %>% 
     group_by(date, sku) %>%
     summarise(sales = sum(sales))

sales.per.store <- sales.original %>% 
     group_by(date, store) %>%
     summarise(sales = sum(sales))

?gcombobox

svalue(dept)











sales.per.store %>% filter(store == 956) %>% with(plot(date, sales, type = 'l', col = 'blue'))
sales_invest <- gwindow("Sales Investigation Window")

BigDataGroup <- ggroup(cont=win)
DataGroup <- gframe("Data", container = BigDataGroup, horizontal=FALSE)

w <- gwindow("notebook example")
nb <- gnotebook(cont=w)
gg <- ggraphics(cont=nb, label='2',visible=FALSE)
sales.per.store %>% filter(store == 974) %>% with(plot(date, sales, type = 'l', col = 'blue'))

visible(gg) <- TRUE
