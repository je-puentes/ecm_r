#' @title Puxar fonte Monserrate
#' @import showtext
#' @import sysfonts
#' @export
get_font <- function(){
  sysfonts::font_add_google(name = "Montserrat", family = "Montserrat")
  showtext::showtext_auto()
}
#' @title Logo ECM
#' @description Esta função carrega o logo
#' @param base_size Tamanho de fonte
#' @return Tema do ECM
#' @import magick
#' @export
get_logo <- function( ) {
  ecm_logo <- magick::image_read("inst/Images/ecm_logo.png")
  return(ecm_logo)
}
#' @title Tema do Economia Mainstream
#' Esta função gera o tema do Economia Mainstream. Questão de fonte etc..
#' Voce não deveria se preocupar com fontes e etc.
#' @param base_size Tamanho de fonte
#' @return Tema do ECM
#' @import ggplot2
#' @export
theme_ecm <- function(base_size = 12,
                      base_family = 'Montserrat',
                      laranja = "#fa7c01",
                      cinza = "#2f2f2f",
                      branco = "#ffffff",
                      preto =  "#1d1d1d") {
  ggplot2::theme(
    text = element_text(color = branco),
    # Panel border
    panel.border = element_rect(color = laranja, fill = NA, size = 1.2),
    # Position titles labs
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold.italic", family = base_family, color = branco),
    plot.subtitle = element_text(hjust = 0.5, size = 12, face = "bold.italic", family = base_family, color = branco),
    plot.caption = element_text(hjust = 1, size = 10, face = "bold.italic", family = base_family, color = laranja),
    axis.title.x = element_text(hjust = 0.5, size = 14, face = "bold", family = base_family, color = branco),
    axis.title.y = element_text(hjust = 0.5, size = 14, face = "bold", family = base_family, color = branco),
    # Plot and Panel background
    plot.background = element_rect(fill=cinza),
    panel.background = element_rect(fill = branco),
    panel.grid.major = element_line(color = "#d3d3d3"),
    panel.grid.minor = element_line(color = branco),
    # Axis optins
    axis.text = element_text(color = branco, colour = branco),
    # Legend option
    legend.title = element_text(colour = branco, color = branco, size=10,
                                face = "bold", family = base_family),
    legend.text = element_text(colour = branco, color = branco, size=10,
                               face = "bold", family = base_family))
}
#' @title Adicionar logo do Economia Mainstream
#' Esta função adiciona o logo do Economia Mainstream no canto inferior esquerdo
#' @param position_x Localização do logo em relação ao eixo X. Pré-definido para 0.07
#' @param position_y Localização do logo em relação ao eixo Y. Pré-definido para -0.03
#' @param width_set Define a largura do logo em inches. Pré-definido em 1.5
#' @return Adiciona o logo do ECM no canto inferior esquerdo do Plot.
#' @import grid
#' @export
add_logo <- function(logo, position_x = 0.07, position_y = -.03, width_set = 1.5){
  grid::grid.raster(logo, x = position_x, y = position_y, just = c('left', 'bottom'), width = unit(width_set, 'inches'))
}
