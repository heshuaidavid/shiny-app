source('helpers.R')
#pre-treatment
shinyServer(
  function(input, output) {
    observeEvent(input$check_formation, {
      if (input$check_formation) {
        output$pdcurve <- renderPlot({
          args <- switch(input$formation_var,
                         "Barnett" = list(production_data, Barnett, input$range[1], input$range[2]),
                         "Eagle Ford" = list(production_data, Eagle_Ford, input$range[1], input$range[2]),
                         "Cotton Valley" = list(production_data, Cotton_Valley, input$range[1], input$range[2]),
                         "Permian" = list(production_data, Permian, input$range[1], input$range[2]))
          do.call(formation_curve, args)
        })
        output$texas_county <- renderPlot({
          args1 <- switch(input$formation_var,
                         "Barnett" = list(texas, Barnett),
                         "Eagle Ford" = list(texas, Eagle_Ford),
                         "Cotton Valley" = list(texas, Cotton_Valley),
                         "Permian" = list(texas, Permian))
          do.call(plot_county, args1)
        })
      } else {
        observeEvent(input$log, {
          if (input$log) {
            output$pdcurve <- renderPlot({
              args <- list(production_data, input$county_var, input$range[1], input$range[2])
              do.call(county_curve_log,args)
            })
            output$texas_county <- renderPlot({
              args <- list(texas, input$county_var)
              do.call(plot_county, args)
            })
          } else {
              output$pdcurve <- renderPlot({
                args <- list(production_data, input$county_var, input$range[1], input$range[2])
                do.call(county_curve,args)
              })
              output$texas_county <- renderPlot({
                args <- list(texas, input$county_var)
                do.call(plot_county, args)
              })
          }
        })
       
      }
      })
  }
)