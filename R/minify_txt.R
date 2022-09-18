#' Minifies text by removing extra white space
#'
#' @param q text to be minified
#'
#' @return minified text
#' @export
#'
#' @examples minify_txt(" This is   a lot of whitespace    ")
minify_txt <- function(q){

  q <- stringr::str_replace(gsub("\\s+", " ",stringr::str_trim(q)), "B", "b")

  return(q)
}
