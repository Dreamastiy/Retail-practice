## Functions to use in interface
## In the step functions which will be used in interface are defined

getFactorVector <- function(datamart){
     nm <- names(datamart)
     cl <- sapply(datamart, class)
     return(nm[cl == 'factor'])
}


update_exp_values <- function(){
     
}


update_plot_exploration <- function(ggraphics, exp.feat, aggr.feat, datamart){
     datamart.to.plot <- datamart %>% filter()
     sales.per.store %>% filter(store == svalue(items)) %>% with(plot(date, sales, type = 'l', col = 'blue'))
     
     update_plot_exploration(gg, features.exp, features.aggr)
}


aggregated_plot <- function(df, xname, yname, byname){
     df.temp <- df %>% group_by_(xname, byname) %>% summarise(yname = sum(!!sym(yname))) %>% ungroup()
     names(df.temp) <- c(xname, byname, yname)
     sapply(df.temp, class)
     min(df.temp$date)
     xmin <- min(df.temp[[xname]])
     xmax <- max(df.temp[[xname]])
     ymin <- min(df.temp[[yname]])
     ymax <- max(df.temp[[yname]])
     # plot.new()
     # plot.ew(NA, xlim = c(xmin, xmax), ylim = c(xmin, xmax))
     interaction.plot(x.factor =  df.temp[[xname]], 
                      response = df.temp[[yname]], 
                      trace.factor = df.temp[[byname]], 
                      legend = F, col = 1:10,
                      xlab = xname,
                      ylab = yname)
     ?interaction.plot
     # points(df.temp[[xname]], rep(100000, 900))
     # plot(x = df.temp[[xname]], y = df.temp[[yname]])
     
}

aggregated_plot(sales.datamart, 'date', 'sales', 'store')
