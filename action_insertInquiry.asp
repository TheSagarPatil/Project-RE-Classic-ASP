<!-- #Include File="cfg_config.asp"-->
<%
prop = request.querystring("prop")
cust = request.querystring("cust")
inqStatus = request.querystring("inqStatus")

query = "INSERT INTO tbl_inquiry Values ("&cust&", 3, "&prop&", Date(), 'pending')"
'query = "INSERT INTO tbl_inquiry Values (8, null, 3, Date(), 'pending')"
Response.Write(query)
on error resume next
conn.Execute(query)
msg = "aa"
if err<>0 then
	msg="AlreadyExists"
	response.write(msg)
else
	msg="Property" & prop & "AddedToInquiryList"
	response.write(msg)
end if
Response.Write("done")
Response.Redirect("Default.asp?cust="&cust&"&prop="&prop&"msg="&msg)
%>