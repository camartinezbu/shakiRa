#' Color palettes
#'
#' @export
shakira_palettes <- list(
  `magia` = c("#79ABDC", "#9FBB8B" ,"#C26151", "#E95485","#F4DC6A","#F2A569"),
  `peligro` = c("#D1A5B2","#B98184","#E93F37", "#714346","#423134"),
  `piesDescalzos` = c("#9A5071","#ECCDB1","#653739", "#C1832E","#83856D"),
  `dondeEstanLosLadrones` = c("#C56789","#744356", "#B63530","#E7B89E","#251919"),
  `servicioDeLavanderia` = c("#DEBB77", "#C87153", "#9D7458", "#2C211D", "#8F502F"),
  `fijacionOralVol1` = c("#B22E29","#501115","#BC9388", "#CEC1C2","#C29674"),
  `fijacionOralVol2` = c("#3A5042","#D1A37F","#39261E","#71323A","#E7D4AF"),
  `loba` = c("#72C1C8","#EEBD92","#519F86","#CF9762", "#CF9762","#1A0622"),
  `saleElSol` = c("#835174","#FCE7BB","#DD9386","#C95771"),
  `shakira` = c("#21285A", "#F7F2EF", "#CE8679", "#A3617C"),
  `elDorado` = c("#DEC9B1","#EEE4DA","#C8A68A", "#D8C582", "#B07A6E")
)


#' Function to interpolate a color palette
#'
#' @param palette Character name of palette in shakira_palettes
#' @param reverse Boolean true if palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#' @export
shakira_pal <- function(palette = "dondeEstanLosLadrones", reverse = FALSE, ...){
  pal <- shakira_palettes[[palette]]

  if(reverse){
    pal <- rev(pal)
  }

  grDevices::colorRampPalette(pal, ...)
}

#' Color scale for Shakira colors
#'
#' @param palette Character name of palette in shakira_palettes
#' @param discrete Boolean if color aesthetic is discrete
#' @param reverse Boolean indicating whether palette should be reversed
#' @param ... Additional arguments used to discrete_scale() or scale_fill_gradientn()
#'   to automatically interpolate between colours.
#' @export
scale_color_shakira <- function(palette = "dondeEstanLosLadrones",
                               discrete = TRUE, reverse=FALSE,...){
  pal <- shakira_pal(palette = palette, reverse = reverse)

  if(discrete){
    ggplot2::discrete_scale("colour", paste0("shakira_", palette), palette = pal, ...)
  }else{
    ggplot2::scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale for Shakira colors
#'
#' @param palette Character name of palette in shakira_palettes
#' @param discrete Boolean if color aesthetic is discrete
#' @param reverse Boolean if palette should be reversed
#' @param ... Additional arguments used to discrete_scale() or scale_fill_gradientn()
#'   to automatically interpolate between colours.
#' @export
scale_fill_shakira <- function(palette = "dondeEstanLosLadrones",
                              discrete = TRUE, reverse = FALSE, ...){
  pal <- shakira_pal(palette = palette, reverse = reverse)

  if(discrete){
    ggplot2::discrete_scale("fill", paste0("shakira_", palette), palette = pal, ...)
  }else{
    ggplot2::scale_fill_gradientn(colours = pal(256),...)
  }
}

