## Functions to use in interface
## In the step functions which will be used in interface are defined

getFactorVector <- function(datamart){
     nm <- names(datamart)
     cl <- sapply(datamart, class)
     return(nm[cl == 'factor'])
}


update_exp_values() <- function(){
     
}


update_plot_exploration() <- function(ggraphics, exp.feat, aggr.feat, datamart){
     datamart.to.plot <- datamart %>% filter()
     sales.per.store %>% filter(store == svalue(items)) %>% with(plot(date, sales, type = 'l', col = 'blue'))
     
     update_plot_exploration(gg, features.exp, features.aggr)
}