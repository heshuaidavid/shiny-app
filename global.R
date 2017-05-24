library(shiny)
library(dplyr)
library(ggplot2)
# Visualization of Texas Oil & Gas Production in Shiny
# date manipulation
texas = read.csv("./data/texas.csv", stringsAsFactors = FALSE)
production_data = read.csv("./data/merged.csv", stringsAsFactors = FALSE)
names(production_data)[1] <- 'time'
production_data$time = as.Date(production_data$time)
production_data$county = as.factor(production_data$county)
county_list = texas %>% distinct(county)
date1 = as.Date('01/01/1993', '%m/%d/%Y')
date2 = as.Date('01/01/2017', '%m/%d/%Y')
date_range = seq(date1, date2, by='month')
Barnett = c('wise', 'denton', 'tarrant', 'johnson', 'jack', 'parker',
            'palo pinto', 'erath','hood','bosque','hill','somervell','montague','cooke')
Eagle_Ford = c('maverick', 'zavala', 'frio','atascosa',
               'willson','live oak', 'mcmullen', 'karnes', 'de witt', 'gonzales', 'dimmit',
               'la salle', 'webb','wilson')
Cotton_Valley = c('anderson', 'bowie','camp', 'cass', 'cherokee', 'falls', 'franklin','freestone','gregg',
                  'harrison', 'henderson','houston','leon','limestone','marion','milam','morris',
                  'nacogdoches','navarro','panola','red river', 'roberson','rusk',
                  'sabine', 'shelby','smith','titus','upshur')

Permian = c( "andrews","hockley","nolan","borden","howard","pecos","cochran",  
             "irion","reagan","coke","jeff","davis","reeves","crane",    
             "kent","scurry","crosby","kimble","sterling","dawson","lamb" ,    
             "terry","dickens","loving","tom green", "ector","lubbock","upton",    
             "gaines","lynn","ward","garza","martin","winkler","glasscock",
             "midland","yoakum","hale","mitchell","crockett","terrell")