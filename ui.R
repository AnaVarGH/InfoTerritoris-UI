############
#### UI ####
############

# Define UI for application that draws a histogram
ui <- page_fluid (
  ## Google Fonts 'Roboto' ___________________________________________________________________________________________________________________________________________ ##
  tags$head(
    tags$link(rel = "preconnect", href = "https://fonts.googleapis.com"),
    tags$link(rel = "preconnect", href="https://fonts.gstatic.com"),
    tags$link(href = "https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap", rel="stylesheet")
  ),
  ## Google Fonts 'Roboto Slab' ______________________________________________________________________________________________________________________________________ ##
  tags$head(
    tags$link(rel="preconnect", href="https://fonts.googleapis.com"),
    tags$link(rel="preconnect", href="https://fonts.gstatic.com"),
    tags$link(href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;200;300;400;500;600;700;800;900&family=Roboto:wght@100&display=swap", rel="stylesheet")
  ),
  ## css _____________________________________________________________________________________________________________________________________________________________ ##
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "sccs/style.css")
  ),
  ## Favicon _________________________________________________________________________________________________________________________________________________________ ##
  tags$head(
    tags$link(rel="icon", href="http://webs.aspb.cat/guia-comunicacio-digital/guia/img/favicon.ico"),
  ),
  ## ui.R ____________________________________________________________________________________________________________________________________________________________ ##
  ## html content-navbar ___ ##
  bootstrapPage(
    ##tags$iframe(src = "components/header.html", seamless=NA)
    ## <iframe src="www.rstudio.com" seamless></iframe>
    htmlTemplate("www/components/header.html", name = "header-html")
  ),
  
  page_navbar(
    
    title = "Seleccionar Territori per /",
    ##id = "selectBy",
    bg = "#F6F6F6",
    inverse = TRUE,
    
    ## Page 1 ________________________________________________________________________________________________________________________________________________________ ##
    nav_panel(title = "Districte", tags$h6("DISTRICTE I EIX TEMÀTIC", id = "districte-epigraf"),
              
              layout_sidebar(
                sidebar = sidebar(
                  bg = "#F6F6F6",
                  "InfoTerritoris",
                  tags$div(id = "selectInputGrup",
                           selectInput("districte", "Seleccionar el Districte /",
                                       c("Ciutat Vella" = "Ciutat Vella",
                                         "Eixample" = "Eixample",
                                         "Sants-Montjuïc" = "Sants-Montjuïc",
                                         "Les Corts" = "Les Corts",
                                         "Sarrià-Sant Gervasi" = "Sarrià-Sant Gervasi",
                                         "Gràcia" = "Gràcia",
                                         "Horta-Guinardó" = "Horta-Guinardó",
                                         "Nou Barris" = "Nou Barris",
                                         "Sant Andreu" = "Sant Andreu",
                                         "Sant Martí" = "Sant Martí"),
                                       ##tableOutput("data")
                           ),
                           
                           ##"Eixos Temàtics /",
                           selectInput("eix_tematic", "Eixos Temàtics /",
                                       list(`Població` = list("Edat", "Lloc de naixement", "Població que viu sola"),
                                            `Context físic` = list("NO2", "PM10", "Verd urbà", "Soroll diürn", "Soroll nocturn", "Usos del sòl"),
                                            `Context socioeconòmic` = list("Nivell educatiu", "Atur", "Renda familiar disponible", "Risc de pobresa", "Preu mitjà del lloguer", "Pobresa energètica", "Persones soles que fan cures", "Persones soles que fan feines a la llar", "Suport social", "Soledat", "Violència al barri"),
                                            `Salut` = list("Salut percebuda", "Salut mental", "Sobrepès i obesitat", "Trastorns crònics"),
                                            `Conductes i salut` = list("Hores de son", "Qualitat del son", "Activitat física de lleur", "Consum de tabac", "Consum d’alcohol", "Cànnabis", "Joc patològic", "Consum de carn vermella", "Consum de verdures", "Consum de fruites"),
                                            `Salut reproductiva` = list("Embaràs", "Naixements", "Avortaments", "Baix pes en néixer", "Prematuritat", "Embaràs adolescent", "Naixements adolescents", "Avortament adolescent"),
                                            `Serveis sanitaris` = list("Cobertura sanitària"),
                                            `MDO (Malalties de declaració obligatòria)` = list("Gonocòccia", "Sífilis", "Clamídia", "LGV", "Tuberculosi", "VIH"),
                                            `Mortalitat` = list("Esperança de vida", "Mortalitat global", "Mortalitat estandarditzada per edat", "Mortalitat prematura"),
                                            `Urban Heart` = list("Urban Heart")),
                           ),
                  ),
                  tags$div(id = "footer"),
                ),
                
                fixedRow(id = "row-header",
                         ## Content Title      
                         tags$h1(textOutput("result"), id = "districte-titol"),
                         ## Buttons, Download & Help
                         tags$div(id = "btns",
                                  tags$div(id = "btn-help",
                                           actionButton(
                                             "show", "Ajuda"
                                           ),
                                           tags$img(id = "question-mark", src="img/help-circle.svg"),
                                  ),
                                  downloadButton(
                                    outputId = "downloadDistricte",
                                    label = "Descarregar"
                                  )
                         )
                ),
                
                cards <- list(
                  layout_columns(
                    card(
                      card_header("Distribució de la població segons grups d´edat i lloc de naixement. Dones, any 2022."),
                      card_body(
                        fig1
                      ),
                      card_footer(
                        tags$p(tags$span(class = "bar-legend red-legend"), "Dones nascudes a l´Estat Espanyol"),
                        tags$p(tags$span(class = "marker-legend red-legend"), "Dones nascudes a l´estranger")
                      )
                    ),
                    card(
                      card_header("Distribucio de la poblacio segons grups d´edat i lloc de naixement. Homes, any 2022."),
                      card_body(
                        fig2
                      ),
                      card_footer(
                        tags$p(tags$span(class = "bar-legend blue-legend"), "Homes nascuts a l´Estat Espanyol"),
                        tags$p(tags$span(class = "marker-legend blue-legend"), "Homes nascuts a l´estranger")
                      )
                    ),
                  ),
                  layout_columns(
                    card(
                      card_header("Distribució de la població segons lloc de naixement. Any 2022."),
                      card_body(
                        fig3
                      ),
                      card_footer(
                        tags$p(tags$span(class = "bar-legend blue-legend"), "Fora de l´esta Espanyol"),
                        tags$p(tags$span(class = "bar-legend orange-legend"), "Resta de l´esta Espanyol"),
                        tags$p(tags$span(class = "bar-legend green-legend"), "Resta de Catalunya"),
                        tags$p(tags$span(class = "bar-legend red-legend"), "Barcelona")
                      )
                    ),
                    card(
                      card_header("Distribució de la població nascuda a l´estranger segons regió de procedència. Any 2022."),
                      card_body(
                        fig4
                      ),
                      card_footer(
                        
                        tags$p(tags$span(class = "bar-legend blue-legend"), "Unió Europea - 15"),
                        tags$p(tags$span(class = "bar-legend orange-legend"), "Resta de països de renda alta"),
                        tags$p(tags$span(class = "bar-legend green-legend"), "Resta d´Europa"),
                        tags$p(tags$span(class = "bar-legend red-legend"), "Resta d´Asia i Oceania"),
                        tags$p(tags$span(class = "bar-legend yellow-legend"), "Resta d´Africa"),
                        tags$p(tags$span(class = "bar-legend purple-legend"), "Países del Magrib"),
                        tags$p(tags$span(class = "bar-legend gray-legend"), "Centre i Sudamèrica")
                        
                      )
                    ),
                  )
                ),
              ),
    ),
    
    ## Page 2 ________________________________________________________________________________________________________________________________________________________ ##
    nav_panel(title = "Barri", tags$h6("BARRI I EIX TEMÀTIC", id = "barri-epigraf"),
              
              layout_sidebar(
                sidebar = sidebar(
                  bg = "#F6F6F6",
                  "InfoTerritoris",
                  tags$div(id = "selectInputGrup",
                           selectInput("barri", "Seleccionar el Barri /",
                                       list(`Ciutat Vella` = list("Barceloneta", "Casc Antic", "Gòtic", "Raval Sud", "Raval Nord"),
                                            `Eixample` = list("Sant Antoni", "Via Roma", "Esquerra Eixample", "Universitat", "Casanova", "Dreta Eixample", "Passeig Sant Joan", "Sagrada Família", "Monumental", "Sagrada Família"),
                                            `Sants-Montjuïc` = list("Les Hortes-Poble Sec", "Poble Sec", "Dr. Carles Riba", "Bordeta", "Sants", "Numància", "La Marina", "Badal"),
                                            `Les Corts` = list("Montnegre", "Les Corts-Pedralbes", "Les Corts-Helios"),
                                            `Sarrià-Sant Gervasi` = list("Marc Aureli", "Sant Elies", "Sarrià", "Vallvidrera-Les Planes", "Sant Gervasi"),
                                            `Gràcia` = list("Joanic", "Vila de Gràcia", "Lesseps", "Vallcarca", "La Salut"),
                                            `Horta-Guinardó` = list("Sanllehy", "Sardenya", "El Carmel", "Lisboa", "Sant Rafael", "Lisboa", "Guinardó"),
                                            `Nou Barris` = list("Turó de la Peira", "Guineueta", "Roquetes- Canteres", "Ciutat Meridiana", "Xafarines", "Cotxeres", "Porta", "Prosperitat-Verdum"),
                                            `Sant Andreu` = list("Sagrera", "Congrés", "Bon Pastor", "Via Barcino", "Sant Andreu", "Casernes", "Maragall-Tolosa"),
                                            `Sant Martí` = list("Vila Olímpica", "Ramon Turró", "Poble Nou", "Besòs", "Encants", "Camp de l'Arpa", "El Clot", "Sant Martí", "La Pau", "Verneda Sud")),
                                       ##tableOutput("data")
                           ),
                           
                           ##"Eixos Temàtics /",
                           selectInput("eix_tematic_barri", "Eixos Temàtics /",
                                       list(`Població` = list("Edat", "Lloc de naixement", "Població que viu sola"),
                                            `Context físic` = list("NO2", "PM10", "Verd urbà", "Soroll diürn", "Soroll nocturn", "Usos del sòl"),
                                            `Context socioeconòmic` = list("Nivell educatiu", "Atur", "Renda familiar disponible", "Risc de pobresa", "Preu mitjà del lloguer", "Pobresa energètica", "Persones soles que fan cures", "Persones soles que fan feines a la llar", "Suport social", "Soledat", "Violència al barri"),
                                            `Salut` = list("Salut percebuda", "Salut mental", "Sobrepès i obesitat", "Trastorns crònics"),
                                            `Conductes i salut` = list("Hores de son", "Qualitat del son", "Activitat física de lleur", "Consum de tabac", "Consum d’alcohol", "Cànnabis", "Joc patològic", "Consum de carn vermella", "Consum de verdures", "Consum de fruites"),
                                            `Salut reproductiva` = list("Embaràs", "Naixements", "Avortaments", "Baix pes en néixer", "Prematuritat", "Embaràs adolescent", "Naixements adolescents", "Avortament adolescent"),
                                            `Serveis sanitaris` = list("Cobertura sanitària"),
                                            `MDO (Malalties de declaració obligatòria)` = list("Gonocòccia", "Sífilis", "Clamídia", "LGV", "Tuberculosi", "VIH"),
                                            `Mortalitat` = list("Esperança de vida", "Mortalitat global", "Mortalitat estandarditzada per edat", "Mortalitat prematura"),
                                            `Urban Heart` = list("Urban Heart")),
                           ),
                  ),
                  tags$div(id = "footer"),
                ),
                
                fixedRow(id = "row-header",
                         ## Content Title      
                         tags$h1(textOutput("resultTwo"), id = "barri-titol"),
                         ## Buttons, Download & Help
                         tags$div(id = "btns",
                                  tags$div(id = "btn-help",
                                           actionButton(
                                             "show", "Ajuda"
                                           ),
                                           tags$img(id = "question-mark", src="img/help-circle.svg"),
                                  ),
                                  downloadButton(
                                    outputId = "downloadBarri",
                                    label = "Descarregar"
                                  )
                         )
                ),
                
                cards <- list(
                  layout_columns(
                    card(
                      full_screen = TRUE,
                      card_header("Títol de la gràfica 01."),
                      plotOutput("distPlot")
                    ),
                    card(
                      full_screen = TRUE,
                      card_header("Títol de la gràfica 02."),
                      plotOutput("distPlot")
                    )
                  ),
                  layout_columns(
                    card(
                      full_screen = TRUE,
                      card_header("Títol de la gràfica 03."),
                      plotOutput("distPlot")
                    ),
                    card()
                  )
                ),
              ),
    ),
    
    ## Page 3 ________________________________________________________________________________________________________________________________________________________ ##
    nav_panel(title = "Àrea bàsica de Salut", tags$h6("ÀREA BÀSICA DE SALUT I EIX TEMÀTIC", id = "area_basica_de_salut-epigraf"),
              
              layout_sidebar(
                sidebar = sidebar(
                  bg = "#F6F6F6",
                  "InfoTerritoris",
                  tags$div(id = "selectInputGrup",
                           selectInput("area_basica_de_salut", "Seleccionar el Àrea bàsica de Salut /",
                                       list(`Ciutat Vella` = list("1A - Barceloneta", "1B - Casc Antic", "1C - Gòtic", "1D - Raval Sud", "1E - Raval Nord"),
                                            `Eixample` = list("2A - Sant Antoni", "2B - Via Roma", "2C - Esquerra Eixample", "2D - Universitat", "2E - Casanova", "2G - Dreta Eixample", "2H - Passeig Sant Joan", "2I - Sagrada Família", "2J - Monumental", "2K - Sagrada Família"),
                                            `Sants-Montjuïc` = list("3A - Les Hortes-Poble Sec", "3B - Poble Sec", "3C - Dr. Carles Riba", "3D - Bordeta", "3E - Sants", "3G - Numància", "3H - La Marina", "3I - Badal"),
                                            `Les Corts` = list("4A - Montnegre", "4B - Les Corts-Pedralbes", "4C - Les Corts-Helios"),
                                            `Sarrià-Sant Gervasi` = list("5A - Marc Aureli", "5B - Sant Elies", "5C - Sarrià", "5D - Vallvidrera-Les Planes", "5E - Sant Gervasi"),
                                            `Gràcia` = list("6A - Joanic", "6B - Vila de Gràcia", "6C - Lesseps", "6D - Vallcarca", "6E - La Salut"),
                                            `Horta-Guinardó` = list("7A - Sanllehy", "7B - Sardenya", "7C - El Carmel", "7D - Lisboa", "7E - Sant Rafael", "7F - Lisboa", "7F - Guinardó"),
                                            `Nou Barris` = list("8C - Turó de la Peira", "8F - Guineueta", "8G - Roquetes - Canteres", "8H - Ciutat Meridiana", "8I - Xafarines", "8J - Cotxeres", "8K - Porta", "8L - Prosperitat-Verdum"),
                                            `Sant Andreu` = list("9A - Sagrera", "9C - Congrés", "9E - Bon Pastor", "9F - Via Barcino", "9H - Sant Andreu", "9I - Casernes", "9J - Maragall-Tolosa"),
                                            `Sant Martí` = list("10A - Vila Olímpica", "10B - Ramon Turró", "10C - Poble Nou", "10D - Besòs", "10E - Encants", "10F - Camp de l'Arpa", "10G - El Clot", "10H - Sant Martí", "10I - La Pau", "10J - Verneda Sud")),
                                       ##tableOutput("data")
                           ),
                           
                           ##"Eixos Temàtics /",
                           selectInput("eix_tematic_area_basica_de_salut", "Eixos Temàtics /",
                                       list(`Població` = list("Edat", "Lloc de naixement", "Població que viu sola"),
                                            `Context físic` = list("NO2", "PM10", "Verd urbà", "Soroll diürn", "Soroll nocturn", "Usos del sòl"),
                                            `Context socioeconòmic` = list("Nivell educatiu", "Atur", "Renda familiar disponible", "Risc de pobresa", "Preu mitjà del lloguer", "Pobresa energètica", "Persones soles que fan cures", "Persones soles que fan feines a la llar", "Suport social", "Soledat", "Violència al barri"),
                                            `Salut` = list("Salut percebuda", "Salut mental", "Sobrepès i obesitat", "Trastorns crònics"),
                                            `Conductes i salut` = list("Hores de son", "Qualitat del son", "Activitat física de lleur", "Consum de tabac", "Consum d’alcohol", "Cànnabis", "Joc patològic", "Consum de carn vermella", "Consum de verdures", "Consum de fruites"),
                                            `Salut reproductiva` = list("Embaràs", "Naixements", "Avortaments", "Baix pes en néixer", "Prematuritat", "Embaràs adolescent", "Naixements adolescents", "Avortament adolescent"),
                                            `Serveis sanitaris` = list("Cobertura sanitària"),
                                            `MDO (Malalties de declaració obligatòria)` = list("Gonocòccia", "Sífilis", "Clamídia", "LGV", "Tuberculosi", "VIH"),
                                            `Mortalitat` = list("Esperança de vida", "Mortalitat global", "Mortalitat estandarditzada per edat", "Mortalitat prematura"),
                                            `Urban Heart` = list("Urban Heart")),
                           ),
                  ),
                  tags$div(id = "footer"),
                ),
                
                fixedRow(id = "row-header",
                         ## Content Title      
                         tags$h1(textOutput("resultThree"), id = "area_basica_de_salut-titol"),
                         ## Buttons, Download & Help
                         tags$div(id = "btns",
                                  tags$div(id = "btn-help",
                                           actionButton(
                                             "show", "Ajuda"
                                           ),
                                           tags$img(id = "question-mark", src="img/help-circle.svg"),
                                  ),
                                  downloadButton(
                                    outputId = "downloadArea",
                                    label = "Descarregar"
                                  )
                         )
                ),
                
                cards <- list(
                  layout_columns(
                    card(
                      full_screen = TRUE,
                      card_header("Títol de la gràfica 01."),
                      plotOutput("distPlot")
                    ),
                    card(
                      full_screen = TRUE,
                      card_header("Títol de la gràfica 02."),
                      plotOutput("distPlot")
                    )
                  ),
                  layout_columns(
                    card(
                      full_screen = TRUE,
                      card_header("Títol de la gràfica 03."),
                      plotOutput("distPlot")
                    ),
                    card()
                  )
                )
              )
    )
  )
)