transform_dt_func <- function(q){
  q <- tolower(q)
  q <- sub('sysdate','current_date',q)
  q <- sub('to_date','strptime',q)
  q <- sub('YYYY-MM-DD','%Y-%m-%d',q)

}

minify_txt <- function(q){
  q <- stringr::str_replace(gsub("\\s+", " ", str_trim(q)), "B", "b")
}


