## Interface definition
## In the step interface is build and described
## Functions from 3_interface_functions are used

##########################
## Interface definition ##
##########################

win.investigate <- gwindow("Sales Investigtaion")
cont.main <- ggroup(cont = win.investigate)
frame.params <- gframe("Parameters", container = cont.main, horizontal = FALSE)

input.exp.level.frame <- gframe("1. Exploration level", container = frame.params, horizontal=FALSE)
input.exp.level <- ggroup(horizontal = FALSE, container = input.exp.level.frame)
# lbl.text.input1 <- glabel("Choose Store From List",  container = grp.text.input1)

input.aggr.level.frame <- gframe("2. Aggregation level", container = frame.params, horizontal=FALSE)
input.aggr.level <- ggroup(horizontal = FALSE, container = input.aggr.level.frame)


input.exp.value.frame <- gframe("3. Exploration value", container = frame.params, horizontal=FALSE)
input.exp.value <- ggroup(horizontal = FALSE, container = input.exp.level.frame)

input.aggr.value.hl.frame <- gframe("4.1 Aggregation level highlight", container = frame.params, horizontal=FALSE)
input.aggr.value.hl <- ggroup(horizontal = FALSE, container = input.aggr.value.hl.frame)

input.aggr.value.frame <- gframe("4.2 Aggregation level values", container = frame.params, horizontal=FALSE)
input.aggr.value <- ggroup(horizontal = FALSE, container = input.aggr.value.frame)
# g.fd1 <- ggraphics(width=200, height=500, ps=11, container=input.aggr.value)


frame.plot <- gframe("Plot", container = cont.main, horizontal = FALSE)
plot.group <- ggroup(horizontal = FALSE, container = frame.plot)
gg <- ggraphics(cont = plot.group, label='', visible = TRUE)

?gframe
#############################
## Put values in interface ##
#############################

features.grouping <- getFactorVector(sales.datamart)
feature.exp.values <- unique(sales.datamart$store)#c()
# features.exp <- c()
features.exp.values <- c()
features.aggr <- c()
features.values.checked <- c()
features.values.hl <- c()

exp.items <-  gcombobox(features.grouping, 
                        container = input.exp.level, 
                        handler = function(h,...){
                             features.exp <- svalue(exp.items)
                             # update_plot_exploration(gg, features.exp, features.aggr, sales.datamart)
                             update_exp_values(features.exp.values, features.exp, )
                        })

exp.items.values <-  gcombobox(feature.exp.values, 
                        container = input.exp.value, 
                        handler = function(h,...){
                             features.exp <- svalue(exp.items)
                             # update_plot_exploration(gg, features.exp, features.aggr, sales.datamart)
                             update_exp_values()
                        })


aggr.items <-  gcombobox(features.grouping, 
                        container = input.aggr.level, 
                        handler = function(h,...){
                             features.aggr <- svalue(aggr.items)
                             update_plot_exploration(gg, features.exp, features.aggr, sales.datamart)
                        })

aggr.hl.items <-  gcombobox(feature.values,
                            container = input.aggr.value.hl,
                            handler = function(h,...){
                                 features.values.hl <- svalue(aggr.hl.items)
                                 # update_plot_exploration()
                            })

aggr.values.items <-  gcheckboxgroup(feature.values,
                                container = input.aggr.value,
                                use.table = T,
                                handler = function(h,...){
                                     # features.values.checked <- svalue(aggr.values.items)
                                })



?gframe


unique.stores <- unique(sales.original$store)
unique.articles <- unique(sales.original$sku)


# gp <- ggroup(horizontal = FALSE, container = Input1Group)
Input2Group <- gframe("Store Sales Plot", container = DataGroup, horizontal=FALSE)
grp.text.input2 <- ggroup(horizontal = FALSE, container = Input2Group)
lbl.text.input2 <- glabel("Store Sales Plot",  container = grp.text.input2)
# gcombobox
items <- gcombobox(unique.stores, container = grp.text.input1 ,
                   handler = function(h,...){
                        # sales.per.store %>% filter(store == svalue(items)) %>% with(plot(date, sales, type = 'l', col = 'blue'))
                        # nb <- gnotebook(cont=w)
                        
                        sales.per.store %>% filter(store == svalue(items)) %>% with(plot(date, sales, type = 'l', col = 'blue'))
                        # visible(gg) <- TRUE
                        
                        # oldval <- svalue(dept)
                        # if (svalue(dept) == "Arts")
                        # {
                        #      a1 <- productArts
                        # }
                        # if(svalue(dept) == "Electronics")
                        # {
                        #      a1 <- productElectronics                      
                        # }
                   }
)
