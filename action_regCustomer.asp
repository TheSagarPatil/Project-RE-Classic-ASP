
<!-- #Include File="cfg_config.asp" -->
<%
id = request.querystring("id")
query2="insert into tbl_customer values ("&id&");"
Response.Write("<br/>"&query2)
on error resume next
conn.Execute(query2)
if err <> 0 then
	Response.Write("fail "&err)
else
	Response.Write("Done")
end if

msg="successfullyRegistered_id="&id
Response.Write ("<br/>success" & id)
Response.Redirect("login.asp?msg=successFulyRegistered_id"&id)
%>