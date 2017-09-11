library(shiny)

shinyServer(function(input, output) {
  
  output$user_data <- renderText({
    
    paste0("<strong>","Your mass is ", input$mass, " kg and your height is ", input$height, " cm", "</strong>")
    
  })
  
  output$results <- renderText({
    
    bmi = round(input$mass/(input$height/100)^2, 1)
    
    if      (bmi <  15.0){
      condition = "<span style='color: red'>Very severely underweight</span>"
      bmicol='red'
    }
    
    else if (bmi <= 16.0){ 
      condition = "<span style='color: red'>Severely underweight</span>"
      bmicol='red'
    }
    
    else if (bmi <= 18.5) {
      condition = "<span style='color: orange'>Underweight</span>"
      bmicol='orange'
    }
    
    else if (bmi <= 25.0) {
      condition = "<span style='color: green'>Normal</span>"
      bmicol='green'
    }
    
    else if (bmi <= 30.0){
      condition = "<span style='color: orange'>Overweight</span>"
      bmicol='orange'
    }
    
    else if (bmi <= 35.0) {
      condition = "<span style='color: red'>Obese Class I (Moderately obese)</span>"
      bmicol='red'
    }
    
    else if (bmi <= 40.0){
      condition = "<span style='color: red'>Obese Class II (Severely obese)</span>"
      bmicol='red'
    }
    
    else  {
      condition = "<span style='color: red'>Obese Class III (Very severely obese)</span>"
      bmicol='red'
    }
    
    paste0("<strong>", condition, "</strong>")
    
  })
  
  output$plot <- renderPlot({
    bmi = round(input$mass/(input$height/100)^2, 1)
    if (bmi>40) {bmi=40}
    
    if (bmi <  15.0) bmicol='red'
    else if (bmi <= 16.0) bmicol='red'
    else if (bmi <= 18.5) bmicol='orange'
    else if (bmi <= 25.0) bmicol='green'
    else if (bmi <= 30.0) bmicol='orange'
    else if (bmi <= 35.0) bmicol='red'
    else if (bmi <= 40.0) bmicol='red'
    else bmicol='red'
    
    dat<-matrix(c(0,bmi),ncol=1,nrow = 2)
    colnames(dat)<-'BMI'
    rownames(dat)<-c("Normal","Measure")
    
    barplot(dat, horiz = FALSE,width = 10, ylim=c(0,40),xlim = c(0,30), col=c("gray", bmicol))      
    
    if(bmi <38)
      text(6,bmi+3, paste0("Your BMI is ", bmi),cex = 1.5)
    else
      text(6,bmi-3,paste0("Your BMI is ", bmi),cex = 1.5)
  })
  
})
