################
#### SERVER ####
################

## server.R ##
shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
    hist(rnorm(input$obs), col = 'darkgray', border = 'white')
  })
  ## Content Title Districte
  output$result <- renderText({
    paste(input$districte, " / ", input$eix_tematic)
  })
  ## Content Title Barri
  output$resultTwo <- renderText({
    paste(input$barri, " / ", input$eix_tematic_barri)
  })
  ## Content Title Àrea bàsica de Salut
  output$resultThree <- renderText({
    paste(input$area_basica_de_salut, " / ", input$eix_tematic_area_basica_de_salut)
  })
  
  observeEvent(input$show, {
    showModal(modalDialog(
      title = (input$eix_tematic),
      tags$h4("Piràmide de població"),
      tags$p("Definició: Nombre de població segons grups d’edat, sexe i lloc de naixement."),
      tags$p("Font d’informació: Padró Municipal d’Habitants de Barcelona. Ajuntament de Barcelona."),
      footer = modalButton("Tornar a l’aplicació")
    ))
  })
  output$downloadDistricte <- downloadHandler(
    filename = function() {
      paste0(input$dataset, ".csv")
    },
    content = function(file) {
      write.csv(data(), file)
    }
  )
  output$downloadBarri <- downloadHandler(
    filename = function() {
      paste0(input$dataset, ".csv")
    },
    content = function(file) {
      write.csv(data(), file)
    }
  )
  output$downloadArea <- downloadHandler(
    filename = function() {
      paste0(input$dataset, ".csv")
    },
    content = function(file) {
      write.csv(data(), file)
    }
  )
})
