<!-- #Include File="cfg_config.asp"-->
<%
prop = request.querystring("prop")
cust = request.querystring("cust")
inqStatus = request.querystring("inqStatus")

query = "update tbl_inquiry set tbl_inquiry.status = '"&inqStatus&"' where tbl_inquiry.customerId = "&cust&" and tbl_inquiry.propertyId="&prop&";"
Response.Write(query)
on error resume next
conn.Execute(query)
msg = "aa"
if err<>0 then
	response.write("No update permissions!")
	msg="fail"
else
	response.write("Record " & cid & " was updated!")
	msg="done"
end if
Response.Write("done")
Response.Redirect("viewInquiry.asp?cust="&cust&"&prop="&prop&"&msg="&msg)

%>