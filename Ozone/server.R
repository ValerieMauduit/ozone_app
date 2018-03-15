library(shiny)
shinyServer(function(input, output) {
    wmin <- reactive({input$slider_wind[1]})
    wmax <- reactive({input$slider_wind[2]})
    tmin <- reactive({input$slider_temp[1]})
    tmax <- reactive({input$slider_temp[2]})
    subdata <- reactive({
        airquality[airquality$Wind >= wmin() & airquality$Wind <= wmax() &
                       airquality$Temp >= tmin() & airquality$Temp <= tmax(),]})
    modele <- reactive({lm(Ozone ~ Solar.R, data = subdata())})
    
    output$text_wind <- renderText(paste("Wind between ", wmin(), " and ", wmax(), "mph"))
    output$text_temp <- renderText(paste("Temperature between ", tmin(), " and ", tmax(),"°F"))
    
    
    output$plot1 <- renderPlot({
        if (dim(subdata())[1] > 0) {
            plot(subdata()$Solar.R, subdata()$Ozone,
                 xlab = "Solar R (lang)", ylab = "Ozone (ppb)", ylim = c(0, 175))
            abline(modele(), col = "red", lwd = 2)
        } else {
            plot(1, 1, pch = 4, col = "red", cex = 10)
        }
    })
})