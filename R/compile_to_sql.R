
#' Compile picorule text to SQL
#'
#' @param picorule_name Name of the picorule block (AKA block_id)
#' @param picorule_text Body of the picorule syntax
#' @param target_sql Target SQL framework
#' @param compiler_api URI for API
#'
#' @return text with SQL code
#' @export
#'
#' @examples compile_to_sql("ckd","body..","PLSQL","http://localhost:8321/v1/engine/compile")
#'
compile_to_sql <- function(picorule_name, picorule_text, target_sql, compiler_api){

  if(missing(target_sql)){
    target_sql = "PLSQL"
  }

  if(missing(compiler_api)){
    compiler_api = "http://localhost:8321/v1/engine/compile"
  }

  req_body <- list(
    name = picorule_name,
    text = picorule_text,
    table_prefix = "ROUT_",
    target_system = target_system,
    db_schema = "pico"
  )

  req_body_json <-jsonlite::toJSON(req_body, pretty = T, auto_unbox = T)

  # Call API
  res <- httr::POST(
    compiler_api,
    body = req_body_json,
    encode = "json",
    add_headers(.headers = c("Content-Type"="application/json","accept"="application/json"))
  )

  cont <- jsonlite::fromJSON(content(res, "text"))

  sql <-paste(cont$sql_ruleblock$sql_rules$sql, collapse = " ")

  return(sql)

}
