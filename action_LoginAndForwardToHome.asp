<!-- #Include File="cfg_config.asp"-->
<%
in_email = request.form("txt_email")
in_pwd = request.form("txt_password")
in_loginType = request.form("loginType")
'in_loginType = request.querystring("loginType")

'in_email = "sagar@gmail.com"
'in_pwd = "1234"
'in_loginType = "cust"
i = 0
'response.write "1" & request.form("txt_email") & request.form("txt_password") & request.form("loginType")
query = ""
'response.write "<br/> query_set" & in_loginType
customerPersonLoginQuery = "SELECT tbl_customer.customerId, tbl_person.firstName, tbl_person.lastName, tbl_person.email, tbl_person.password FROM tbl_customer, tbl_person WHERE (((tbl_person.email)='"&in_email&"') AND ((tbl_person.password)='"&in_pwd&"'));"
'customerPersonLoginQuery = "SELECT tbl_customer.customerId, tbl_person.firstName, tbl_person.lastName, tbl_person.email, tbl_person.password FROM tbl_customer, tbl_person WHERE (((tbl_person.email)='sagar@gmail.com') AND ((tbl_person.password)='1234'));"

if in_loginType = "cust" then
	query = customerPersonLoginQuery
	'query = "SELECT tbl_customer.customerId, tbl_person.firstName, tbl_person.lastName, tbl_person.email, tbl_person.password FROM tbl_customer, tbl_person WHERE (((tbl_person.email)='sagar@gmail.com') AND ((tbl_person.password)='1234'));"
	'response.write "<br/> query_set2" & query 
end if 
'response.write "<br/>query_set3" & query 

rs.open query, conn, 1,2
'response.write "<br/> query_rutting"

do until rs.EOF
    for each x in rs.Fields
       'Response.Write(x.name & x.value & "<br/>") 
	   Session(x.name) = x.value
    next
	i=i+1
    rs.MoveNext
loop	
Session("access") = in_loginType
if i = 0 then
	rs.close
	conn.close
	response.write "No Records Found"
	Response.Redirect("login.asp?res=incorrect_credentials")
Else
	rs.close
	conn.close
	'respons.write "Logged in"
	Response.Redirect("default.asp")
end if	


'response.write "<br/> i = "&i & Session("firstName")

%>