library("tidyverse")
library("shiny")
library("shinydashboard")
wolves <- read_csv("data/wolves_data/wolves_dataset.csv")
wolves_filter<-wolves%>%
  filter(sex!="NA")
ui <-dashboardPage(
  dashboardHeader(title = "Wolves sex distribution"),
  dashboardSidebar(),
  dashboardBody(
  fluidPage(
    box(title = "Plot Options", width = 3,
    radioButtons("x", "Select Pop", choices = c("AK.PEN","BAN.JAS", "BC","DENALI", "ELLES","GTNP", "INT.AK","MEXICAN","MI", "MT","N.NWT","ONT","SE.AK","SNF","SS.NWT","YNP","YUCH"), 
                       selected = "BC"),
    ),
    box(title = "Sex distribution", width = 7,
      plotOutput("plot", width="600px", height="500px")
      ))))
server <- function(input, output, session) { 
  
  output$plot <- renderPlot({
    wolves_filter %>% 
      filter(pop==input$x) %>% 
      ggplot(aes(x=pop, fill=sex)) + 
      geom_bar(position = "dodge") +
      theme_light(base_size = 18) +
      theme(axis.text.x = element_text(angle = 60, hjust = 1))+
      labs(x = "Pop", y = NULL)
  })
  session$onSessionEnded(stopApp)
  
}

shinyApp(ui, server)
