library(shiny)
shinyUI(fluidPage(
    # title
    titlePanel("Air Quality in NYC"),
    sidebarLayout(
        # side: to choose wind and temperature ranges
        sidebarPanel(
            helpText("Choose wind and temperature ranges to take into account"),
            h3("Data choice"),
            sliderInput("slider_wind", "Wind interval to consider", 1, 21, value = c(7.4, 11.5), step = .1),
            sliderInput("slider_temp", "Temperature interval to consider", 55, 100, value = c(72, 85))
        ),
        mainPanel(
            # main: divided in 2 tabs: one with the app outputs
            # othe with documentation
            tabsetPanel(type = "tabs",
                        tabPanel("Graphic", br(),
                                 h2("Graphical answer"),
                                 textOutput("text_wind"),
                                 textOutput("text_temp"),
                                 plotOutput("plot1"),
                                 h4("You can see above a linear regression of Ozone, depending on Solar R, 
                                    considering your Wind/Temp intervals")),
                        tabPanel("Documentation", br(), 
                                 fluidPage(
                                     h2("How it works?"),
                                     "Data come from ", strong("airquality "), "dataset in R.",
                                     br(), br(),
                                     "You can choose the ", strong("wind"), " range (in MPh) using the top slide 
                                     on the left." ,
                                     br(),
                                     "You can choose the ", strong("temperature"), 
                                     " range (in °F) using the bottom slide on the left." ,
                                     br(), br(),
                                     "At the right, you have this documentation tab...",
                                     br(),
                                     "And, above all, your outputs:",
                                     br(),
                                     "- Text which remember you the wind and temperature ranges,",
                                     br(),
                                     "- A ", em("plotting"), " representing ", strong("Ozone"), 
                                     " (in ppb) depending on ", strong("Solar.R"), 
                                     "ie Solar radiation in Langleys in the frequency band 4000–7700 Angstroms 
                                     from 0800 to 1200 hours at Central Park",
                                     br(),
                                     "- Points are from the subdata corresponding to your wind and temperature ranges",
                                     br(),
                                     "- The red line is the linear regression for these points. ",
                                     em("When you change the ranges (left), red line changes."),
                                     br(),
                                     "- y axis range is fixed",
                                     br(), br(),
                                     em("As you can see, Ozone will be lower when wind is strong.")
                                 ))
            )
        )
    )
))