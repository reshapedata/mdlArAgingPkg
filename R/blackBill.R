#' 黑名单查询
#'
#' @param token
#'
#' @return
#' @export
#'
#' @examples
#' blackBill_view()
blackBill_view <- function(token) {
  sql=paste0('select FProjectNumber as 项目代码,FProjectName as 项目名称,FDate as 日期  from rds_t_rule_blackBill')
  res=tsda::sql_select2(token = token,sql =sql )
  return(res)

}
#' 黑名单删除
#'
#' @param token
#' @param FProjectNumber
#'
#' @return
#' @export
#'
#' @examples
#' blackBill_delete()
blackBill_delete <- function(token,FProjectNumber) {
  sql=paste0("delete from rds_t_rule_blackBill where FProjectNumber='",FProjectNumber,"'")
  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)

}
