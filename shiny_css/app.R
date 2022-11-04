#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)
#Enter click
jscode <- '
$(function() {
  var $els = $("[data-proxy-click]");
  $.each(
    $els,
    function(idx, el) {
      var $el = $(el);
      var $proxy = $("#" + $el.data("proxyClick"));
      $el.keydown(function (e) {
        if (e.keyCode == 13) {
          $proxy.click();
        }
      });
    }
  );
});
'
# Define UI for application that draws a histogram
ui <- fluidPage(
  tags$style(HTML(readRDS('css.RDS'))),
tags$head(tags$script(HTML(jscode))),
`data-proxy-click` = "apply",
    # Application title
    titlePanel("CSS for R-ummies"),
shinyWidgets::useBs4Dash(),
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textAreaInput("css", 'CSS Console',value = readRDS('input_css.RDS')),
            actionButton('apply', 'Apply CSS')
        ),

        # Show a plot of the generated distribution
        mainPanel(
           uiOutput('css_ui'),
           bs4Dash::box(title = h3("HTML & CSS HACKING", style = 'font-size:25px;color:black;',align = "center"),
                        width = 12,
                        status = "lightblue",
                        collapsed = TRUE,
                        fluidRow(
                          div(style = 'margin: 0 auto;',
                              h3("Find the element path", style = 'font-size:25px;color:black;',align = "center"),
                              img(src = 'copy_selector.gif', style = 'width: 1000px; padding-inline: 20px'),
                              h3("Paste into the CSS console", style = 'font-size:25px;color:black;',align = "center"),
                              img(src = 'html_selector.gif', style = 'width: 1000px; padding-inline: 20px')
                        )
           )),
           br(),
           bs4Dash::box(title = h3("Ejercicio 1", style = 'font-size:25px;color:black;',align = "center"),
                        width = 12,
                        status = "lightblue",
                        collapsed = TRUE,
             fluidRow(
               div(style = 'margin: 0 auto;',
                   actionButton('button_1','Start'),
               img(src = 'arrow.png', style = 'width: 200px; padding-inline: 20px'),
                   actionButton('button_2','Goal'))
             ),
             br(),
             fluidRow(div(style = 'margin: 0 auto;',actionButton('show_1', 'Show me the answer'))),
             br(),
             fluidRow(div(style = 'margin: 0px auto; margin-bottom:20 px;
                          box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;',
                          verbatimTextOutput('answer_1')))
           ),
           br(),
           bs4Dash::box(title = h3("Ejercicio 2", style = 'font-size:25px;color:black;',align = "center"),
                        width = 12,
                        status = "lightblue",
                        collapsed = TRUE,
                        fluidRow(
                          div(style = 'margin-left: 25%;',
                              sliderInput('slider_1', 'slider', 3, 10, 4)),
                              img(src = 'arrow.png', style = 'width: 200px; padding-inline: 20px'),
                              sliderInput('slider_2', 'slider', 3, 10, 4)

                        ),
                        br(),
                        fluidRow(div(style = 'margin: 0 auto;',actionButton('show_2', 'Show me the answer Chief'))),
                        br(),
                        fluidRow(div(style = 'margin: 0px auto; margin-bottom:20 px;
                          box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;',
                          verbatimTextOutput('answer_2')))
           ),
           br(),
           bs4Dash::box(title = h3("Ejercicio 3", style = 'font-size:25px;color:black;',align = "center"),
                        width = 12,
                        status = "lightblue",
                        collapsed = TRUE,
                        fluidRow(
                              column(width = 6, div(style = 'padding-inline: 5px', DT::DTOutput('dt'))),
                              column(width = 6, div(style = 'padding-inline: 5px', DT::DTOutput('dt_2'))),

                        ),
                        br(),
                        fluidRow(div(style = 'margin: 0 auto;',actionButton('show_3', 'Show me the answer Daddy'))),
                        br(),
                        fluidRow(div(style = 'margin: 0px auto; margin-bottom:20 px;
                          box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;',
                          verbatimTextOutput('answer_3')))
           ),
           br(),
           bs4Dash::box(title = h3("Ejercicio 4", style = 'font-size:25px;color:black;',align = "center"),
                        width = 12,
                        status = "lightblue",
                        collapsed = TRUE,
                        h3("Image name: dac_image.png ", style = 'font-size:25px;color:black;',align = "center"),
                        fluidRow(
                          column(width = 6, div(style = 'padding-inline: 5px',div(id = 'square', style = 'height: 400px; width: 400px;
                                       border-style: double'))),
                          column(width = 6, div(style = 'padding-inline: 5px', div(id = 'square_2', style = 'height: 400px; width: 400px;
                                       border-style: double'))),

                        ),
                        br(),
                        fluidRow(div(style = 'margin: 0 auto;',actionButton('show_4', 'Show me the answer Master'))),
                        br(),
                        fluidRow(div(style = 'margin: 0px auto; margin-bottom:20 px;
                          box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;',
                          verbatimTextOutput('answer_4')))
           )
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

# observeEvent(input$apply,

react_val <- reactiveValues(css = NULL,
                            answer_1 = '#button_1 {color:snow; background:#01162c; width: 100px; border-radius: 30px; }\n#button_1:hover {background: snow; color: #01162c}',
                            answer_2 = 'body > div.container-fluid > div.row > div.col-sm-8 > div:nth-child(6) > div > div.card-body > div:nth-child(1) > div:nth-child(1) > div {width: 200px; text-align: center; box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; padding: 10px; border-radius: 10px}

body > div.container-fluid > div.row > div.col-sm-8 > div:nth-child(6) > div > div.card-body > div:nth-child(1) > div:nth-child(1) > div > span > span.irs-bar.irs-bar--single{background: red; border: red}

body > div.container-fluid > div.row > div.col-sm-8 > div:nth-child(6) > div > div.card-body > div:nth-child(1) > div:nth-child(1) > div > span > span.irs > span.irs-single {background: red; border: red}

#slider_1-label{background: red; border-radius: 30px; color:snow; padding-inline:10px}',
                            answer_3 = '#DataTables_Table_1_filter > label > input[type=search]{border-radius: 30px;
padding 5px;}
#DataTables_Table_1_length > label > select {border-radius: 30px;
padding 5px;}
table.dataTable tr.selected td, table.dataTable td.selected {  background-color: #1a3568 !important;
color: snow}
#DataTables_Table_1 > tbody > tr.selected {  background-color: #1a3568 !important;
color: snow}
#DataTables_Table_1 > thead {
    background: #0b1b3a;
    color: snow;
text-align: 50%;
font-size: 30px;
}
#DataTables_Table_1 > thead > tr > th.dt-right.sorting {
text-align: center;
font-size: 30px;
}
#DataTables_Table_1 > tbody > tr > td.dt-right {text-align:center;}
#DataTables_Table_1 > tbody > tr {text-align:center;}
#DataTables_Table_1_paginate > span > a.paginate_button.current {border-radius: 60px
}',
answer_4 ='#square {
background-color: black;
background-image: url(dac_image.png);
background-repeat: no-repeat;
background-size: 200px;
background-position: center;
border-radius: 300px}')

observeEvent(input$apply, {
react_val$css <- input$css
})


  output$css_ui <- renderUI({
    saveRDS(input$css, 'input_css.RDS')

    tags$style(HTML(react_val$css))

})


output$dt <- DT::renderDataTable(DT::datatable(iris%>%
                                                 select(5,2)))
output$dt_2 <- DT::renderDataTable(DT::datatable(iris%>%
                                                   select(5,2)))
output$plot <- renderPlot(

  iris %>%
  ggplot(aes(x = Sepal.Width, y = Petal.Width, col = Species)) +
    geom_point()
)

observeEvent(input$show_1,
             output$answer_1 <- renderText({
               react_val$answer_1
             })
)
observeEvent(input$show_2,
             output$answer_2 <- renderText({
               react_val$answer_2
             })
)
observeEvent(input$show_3,
             output$answer_3 <- renderText({
               react_val$answer_3
             })
)
observeEvent(input$show_4,
             output$answer_4 <- renderText({
               react_val$answer_4
             })
)
}

# Run the application
shinyApp(ui = ui, server = server)
