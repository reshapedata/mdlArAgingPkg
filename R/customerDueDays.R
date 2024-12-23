#' 客户账期查询
#'
#' @param token
#'
#' @return
#' @export
#'
#' @examples
#' customerDueDays_view()
customerDueDays_view <- function(token) {
  sql=paste0('SELECT
FCustomerNumber	as	客户代码	,
FCustomerName	as	客户名称	,
FDueDays	as	账期天数	,
FDueMonths	as	账期月	,
FDueDate	as	账期日	,
FCalcBaseField	as	计算依据	,
Fremark	as	描述
 from rds_t_rule_customerDueDays')
  res=tsda::sql_select2(token = token,sql = sql)
  return(res)

}
#' 客户账期删除
#'
#' @param token
#' @param FCustomerNumber
#'
#' @return
#' @export
#'
#' @examples
#' customerDueDays_delete()
customerDueDays_delete <- function(token,FCustomerNumber) {
  sql=paste0("delete from rds_t_rule_customerDueDays where FCustomerNumber='",FCustomerNumber,"'")
  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)

}

#' 客户账期上传
#'
#' @param file_name
#' @param token
#'
#' @return
#' @export
#'
#' @examples
#' customerDueDays_upload()
customerDueDays_upload <- function(token,file_name) {


  data <- readxl::read_excel(file_name,col_types = c("text", "text", "numeric", "numeric", "numeric", "text", "text"))
  data = as.data.frame(data)

  data = tsdo::na_standard(data)
  #上传服务器----------------
  res=tsda::db_writeTable2(token = token,table_name = 'rds_t_rule_customerDueDays',r_object = data,append = TRUE)

  return(res)

  #end

}

