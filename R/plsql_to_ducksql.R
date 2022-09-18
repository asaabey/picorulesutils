#' Transform ORACLE Date function to be compatible with DUCKDB
#'
#' @param q Oracle SQL code
#'
#' @return DuckDb compatible SQL
#' @export
#'
#' @examples plsql_to_ducksql("sysdate - 730")
plsql_to_ducksql <- function(q){

    q <- tolower(q)
    q <- sub('sysdate','current_date',q)
    q <- sub('to_date','strptime',q)
    q <- sub('YYYY-MM-DD','%Y-%m-%d',q)

    return(q)

}




