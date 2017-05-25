# shiny-app
Texas county-based production data visualization app
Data obtained from Texas Railroad Commission Online Research Query.
Data range from Jan.1993 to Jan.2017
239 counties data are available.

A python script is used to merge all the data into one csv file.

This package contains four R scripts, one python script, and two data files.
R scripts:
global.R -> load data into R, clean data a little bit.
ui.R -> main UI for the shiny app.
server.R -> main functions for input and output.
helpers.R -> store several functions.

Python script:
R_challenge.ipynb -> run in Jupyter notebook, merge all the files downloaded into one file, the county-based data is available upon request, one can find this data at
http://webapps2.rrc.state.tx.us/EWA/productionQueryAction.do;jsessionid=1PSpZmpGtL7jThkLXhGN4QY8TQtVLDygvsGvsKCN9Cp71G7TNd8d!-237531706

Data files:
merged.csv -> merged production data
texas.csv -> geological map
