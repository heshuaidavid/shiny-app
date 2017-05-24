# Visualization of Texas Oil & Gas Production in Shiny

# main UI
shinyUI(fluidPage(
  titlePanel("Monthly Production of Oil and Gas in Texas Counties"), # main title
  sidebarLayout(
    sidebarPanel(
      helpText("Show the county-based monthly production in Texas
               from Jan-1993 to Jan-2017"), ## subtitle
      selectInput("county_var", # choose the residents
                  label = "Select County(s):",
                  choices = c,
                  selected = NULL, multiple = TRUE),
      sliderInput("range", # choose the range
                  label = "Range of year to display:",
                  min = date1, max = date2, value = c(date1, date2)
                  ), # monthly production #seq(date1, date2, by = 'month')
      checkboxInput('log', "log-scale plot", value = FALSE),
      br(),
      helpText("Show the formation-based monthly production in Texas
               from Jan-1993 to Jan-2017"), ## subtitle
      checkboxInput("check_formation","Select data based on formation/basin",value = FALSE),
      selectInput("formation_var",
                  label = "Select a Formation/Basin:",
                  choices = c("Barnett", "Eagle Ford", "Cotton Valley", "Permian"),
                  selected = NULL)
      ),
    mainPanel(h2("Texas Map"),
              plotOutput("texas_county", width = 600, height = 400),
              h2("Production Curve"),
              plotOutput("pdcurve"))
)
))
