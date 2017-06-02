library(dplyr)
library(ggplot2)
library(grid)
county_curve <- function(df, county_name, min_time, max_time){
  if ('ALL' %in% county_name) {
    df_county = df %>% filter(time >= min_time & time <= max_time) %>% 
      group_by(time) %>% summarise(sum_owop = sum(owop), sum_owgp = sum(owgp),
                                   sum_gwgp = sum(gwgp), sum_gwop = sum(gwop))
    p1 <- ggplot(df_county, aes(x = time, y = sum_owop)) + 
      geom_line(size = 1.0) + 
      scale_y_continuous(limits = c(min(df_county$sum_owop), max(df_county$sum_owop))) +
      scale_x_date(limits = c(date1,date2))+
      xlab("time") + 
      ylab("Oil production from oil well (BBL)")
    p2 <- ggplot(df_county, aes(x = time, y = sum_owgp)) + 
      geom_line(size = 1.0) + 
      scale_y_continuous(limits = c(min(df_county$sum_owgp), max(df_county$sum_owgp))) +
      scale_x_date(limits = c(date1,date2))+
      xlab("time") + 
      ylab("Gas production from oil well (MMCF)")
    p3 <- ggplot(df_county, aes(x = time, y = sum_gwop)) + 
      geom_line(size = 1.0) + 
      scale_y_continuous(limits = c(min(df_county$sum_gwop), max(df_county$sum_gwop))) +
      scale_x_date(limits = c(date1,date2))+
      xlab("time") + 
      ylab("Oil production from gas well (MMCF)")
    p4 <- ggplot(df_county, aes(x = time, y = sum_gwgp)) + 
      geom_line(size = 1.0) + 
      scale_y_continuous(limits = c(min(df_county$sum_gwgp), max(df_county$sum_gwgp))) +
      scale_x_date(limits = c(date1,date2))+
      xlab("time") + 
      ylab("Gas production from gas well (MMCF)")
  } else {
    df_county = df %>% filter(county %in% toupper(county_name) & time >= min_time & time <= max_time)
    p1 <- ggplot(df_county, aes(x = time, y = owop)) + 
      geom_line(aes(color = county), size = 1.0) + 
      scale_y_continuous(limits = c(min(df_county$owop), max(df_county$owop))) +
      scale_x_date(limits = c(date1,date2))+
      xlab("time") + 
      ylab("Oil production from oil well (BBL)")
    p2 <- ggplot(df_county, aes(x = time, y = owgp)) + 
      geom_line(aes(color = county), size = 1.0) + 
      scale_y_continuous(limits = c(min(df_county$owgp), max(df_county$owgp))) +
      scale_x_date(limits = c(date1,date2))+
      xlab("time") + 
      ylab("Gas production from oil well (MMCF)")
    p3 <- ggplot(df_county, aes(x = time, y = gwop)) + 
      geom_line(aes(color = county), size = 1.0) + 
      scale_y_continuous(limits = c(min(df_county$gwop), max(df_county$gwop))) +
      scale_x_date(limits = c(date1,date2))+
      xlab("time") + 
      ylab("Oil production from gas well (MMCF)")
    p4 <- ggplot(df_county, aes(x = time, y = gwgp)) + 
      geom_line(aes(color = county), size = 1.0) + 
      scale_y_continuous(limits = c(min(df_county$gwgp), max(df_county$gwgp))) +
      scale_x_date(limits = c(date1,date2))+
      xlab("time") + 
      ylab("Gas production from gas well (MMCF)")
  }
  grid.newpage()
  pushViewport(viewport(layout = grid.layout(nrow = 2, ncol = 2)))
  print (p1, vp = viewport(layout.pos.row = 1,
                           layout.pos.col = 1))
  print (p2, vp = viewport(layout.pos.row = 1,
                           layout.pos.col = 2))
  print (p3, vp = viewport(layout.pos.row = 2,
                           layout.pos.col = 1))
  print (p4, vp = viewport(layout.pos.row = 2,
                           layout.pos.col = 2))
}

county_curve_log <- function(df, county_name, min_time, max_time){
  if ('ALL' %in% county_name) {
    df_county = df %>% filter(time >= min_time & time <= max_time) %>% 
      group_by(time) %>% summarise(sum_owop = sum(owop), sum_owgp = sum(owgp),
                                   sum_gwgp = sum(gwgp), sum_gwop = sum(gwop))
    p1 <- ggplot(df_county, aes(x = time, y = sum_owop)) + 
      geom_line(size = 1.0) + 
      scale_y_continuous(trans = 'log10', limits = c(min(df_county$sum_owop), max(df_county$sum_owop))) +
      scale_x_date(limits = c(date1,date2))+
      xlab("time") + 
      ylab("Oil production from oil well (BBL)")
    p2 <- ggplot(df_county, aes(x = time, y = sum_owgp)) + 
      geom_line(size = 1.0) + 
      scale_y_continuous(trans = 'log10', limits = c(min(df_county$sum_owgp), max(df_county$sum_owgp))) +
      scale_x_date(limits = c(date1,date2))+
      xlab("time") + 
      ylab("Gas production from oil well (MMCF)")
    p3 <- ggplot(df_county, aes(x = time, y = sum_gwop)) + 
      geom_line(size = 1.0) + 
      scale_y_continuous(trans = 'log10', limits = c(min(df_county$sum_gwop), max(df_county$sum_gwop))) +
      scale_x_date(limits = c(date1,date2))+
      xlab("time") + 
      ylab("Oil production from gas well (MMCF)")
    p4 <- ggplot(df_county, aes(x = time, y = sum_gwgp)) + 
      geom_line(size = 1.0) + 
      scale_y_continuous(trans = 'log10', limits = c(min(df_county$sum_gwgp), max(df_county$sum_gwgp))) +
      scale_x_date(limits = c(date1,date2))+
      xlab("time") + 
      ylab("Gas production from gas well (MMCF)")
  } else {
    df_county = df %>% filter(county %in% toupper(county_name) & time >= min_time & time <= max_time)
    p1 <- ggplot(df_county, aes(x = time, y = owop)) + 
      geom_line(aes(color = county), size = 1.0) + 
      scale_y_continuous(trans = 'log10', limits = c(min(df_county$owop), max(df_county$owop))) +
      scale_x_date(limits = c(date1,date2))+
      xlab("time") + 
      ylab("Oil production from oil well (BBL)")
    p2 <- ggplot(df_county, aes(x = time, y = owgp)) + 
      geom_line(aes(color = county), size = 1.0) + 
      scale_y_continuous(trans = 'log10', limits = c(min(df_county$owgp), max(df_county$owgp))) +
      scale_x_date(limits = c(date1,date2))+
      xlab("time") + 
      ylab("Gas production from oil well (MMCF)")
    p3 <- ggplot(df_county, aes(x = time, y = gwop)) + 
      geom_line(aes(color = county), size = 1.0) + 
      scale_y_continuous(trans = 'log10', limits = c(min(df_county$gwop), max(df_county$gwop))) +
      scale_x_date(limits = c(date1,date2))+
      xlab("time") + 
      ylab("Oil production from gas well (MMCF)")
    p4 <- ggplot(df_county, aes(x = time, y = gwgp)) + 
      geom_line(aes(color = county), size = 1.0) + 
      scale_y_continuous(trans = 'log10', limits = c(min(df_county$gwgp), max(df_county$gwgp))) +
      scale_x_date(limits = c(date1,date2))+
      xlab("time") + 
      ylab("Gas production from gas well (MMCF)")
  }
  grid.newpage()
  pushViewport(viewport(layout = grid.layout(nrow = 2, ncol = 2)))
  print (p1, vp = viewport(layout.pos.row = 1,
                           layout.pos.col = 1))
  print (p2, vp = viewport(layout.pos.row = 1,
                           layout.pos.col = 2))
  print (p3, vp = viewport(layout.pos.row = 2,
                           layout.pos.col = 1))
  print (p4, vp = viewport(layout.pos.row = 2,
                           layout.pos.col = 2))
}

formation_curve <- function(df, formation, min_time, max_time){
  formation_name = unlist(lapply(formation, toupper))
  df_formation = df %>% filter(county %in% formation_name &
                              time >= min_time & time <= max_time) %>%
    group_by(time) %>% summarise(sum_owop = sum(owop), sum_owgp = sum(owgp),
                                 sum_gwgp = sum(gwgp), sum_gwop = sum(gwop))
  p1 <- ggplot(df_formation, aes(x = time, y = sum_owop)) + 
    geom_line(color = 'blue', size = 1.0) + 
    scale_y_continuous(trans = 'log10', limits = c(min(df_formation$sum_owop), 
                                                   max(df_formation$sum_owop))) + 
    scale_x_date(limits = c(date1,date2))+
    xlab("time") + 
    ylab("Oil production from oil well (BBL)")
  p2 <- ggplot(df_formation, aes(x = time, y = sum_owgp)) + 
    geom_line(color = 'black', size = 1.0) + 
    scale_y_continuous(trans = 'log10',limits = c(min(df_formation$sum_owgp), 
                                                  max(df_formation$sum_owgp))) +
    scale_x_date(limits = c(date1,date2))+
    xlab("time") + 
    ylab("Gas production from oil well (MMCF)")
  p3 <- ggplot(df_formation, aes(x = time, y = sum_gwop)) + 
    geom_line(color = 'orange', size = 1.0) + 
    scale_y_continuous(trans = 'log10',limits = c(min(df_formation$sum_gwop), 
                                                  max(df_formation$sum_gwop))) +
    scale_x_date(limits = c(date1,date2))+
    xlab("time") + 
    ylab("Oil production from gas well (MMCF)")
  p4 <- ggplot(df_formation, aes(x = time, y = sum_gwgp)) + 
    geom_line(color = 'red', size = 1.0) + 
    scale_y_continuous(trans = 'log10',limits = c(min(df_formation$sum_gwgp), 
                                                  max(df_formation$sum_gwgp))) +
    scale_x_date(limits = c(date1,date2))+
    xlab("time") + 
    ylab("Gas production from gas well (MMCF)")
  
  grid.newpage()
  pushViewport(viewport(layout = grid.layout(nrow = 2, ncol = 2)))
  print (p1, vp = viewport(layout.pos.row = 1,
                           layout.pos.col = 1))
  print (p2, vp = viewport(layout.pos.row = 1,
                           layout.pos.col = 2))
  print (p3, vp = viewport(layout.pos.row = 2,
                           layout.pos.col = 1))
  print (p4, vp = viewport(layout.pos.row = 2,
                           layout.pos.col = 2))
}

plot_county <- function(df, name){
  df_sub = df %>% filter(county %in% name)
  g <- ggplot(df, aes(x=long, y=lat))
  g + geom_point() + 
    geom_polygon(aes(group = county), color = 'black', fill = 'white') + 
    geom_polygon(data = df_sub, aes(fill = county), color = 'blue') +
    theme_bw() + xlab("longitude") + ylab("latitude")
}

# formation_curve(production_data, Eagle_Ford, date1, date2)
