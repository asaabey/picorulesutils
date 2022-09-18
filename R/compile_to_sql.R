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
