shinyServer(function(input, output) {

  output$d3wc <- renderD3wordcloud({
    
    print(as.list(input))
    
    d <- corpus_data[[input$url]] %>% head(input$n_words)
    
    if (input$color_type == "a color by word") {
      colorswc <- sample(input$colors, size = input$n_words, replace = TRUE)
    } else {
      colorswc <- input$colors
    }
      
    d3wordcloud(d$word,
                d$freq,
                font = input$font, 
                colors = colorswc,
                size.scale = input$size_scale,
                color.scale = input$color_scale,
                padding = input$padding,
                spiral = input$spiral,
                rotate.min = input$rotate[1],
                rotate.max = input$rotate[2])
  })
})