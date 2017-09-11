library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Check your own Body Mass Index"),
  
  sidebarLayout(sidebarPanel(
    
    helpText("Please input your mass and heihgt."),
    
    sliderInput(
      
      inputId = "height",
      
      label = strong("Your height in cm:"),
      
      min = 100,
      
      max = 240,
      
      value = 185
      
    ), #User height input slider
    
    sliderInput(
      
      inputId = "mass",
      
      label = strong("Your weight in kg:"),
      
      min = 20,
      
      max = 140,
      
      value = 74
      
    ), #User mass input slider
    
    h5("Body Mass Index (BMI) is a person's weight in kilograms divided by the square of height in meters. A high BMI can be an indicator of high body fatness. BMI can be used to screen for weight categories that may lead to health problems but it is not diagnostic of the body fatness or health of an individual"),
    h6("For more information, please refer: https://www.cdc.gov/healthyweight/")
    
  ),
  
  
  
  mainPanel(
    
    uiOutput("user_data"), #Text with the user data
    
    plotOutput("plot", width = "100%"), #Colorful plot of the user BMI
    
    uiOutput("results") #Text results
    
  ))
  
))