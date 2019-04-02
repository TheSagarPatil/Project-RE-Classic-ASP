<!-- #Include File = "cfg_config.asp" -->
<%
msg=""
prop = request.querystring("prop")
action = request.querystring("action")
customerId = Session("customerId")
sScriptLocation = request.querystring("rdrPath")
iLastSlash      = InStrRev(sScriptLocation, "/")
iScriptLength   = Len(sScriptLocation)
sScriptName     = Right(sScriptLocation, iScriptLength - iLastSlash)
'Response.Write(sScriptName & "<br/>" &sScriptLocation & "<br/>" & iLastSlash& "<br/>" & iScriptLength)
'Response.Write(IsNull(Session("customerId")))
'Response.Write(prop & "<br>" &action & "<br>" &customerId)
if Session("customerId") = "" then
	response.write ("<br/>customerId Empty"&Session("customerId"))
	'Response.Redirect(sScriptName&"msg=PleaseLogin")
else
	response.write ("<br/>customerId Exist "&Session("customerId"))
	if action = "del" then
		deletequery = "delete FROM tbl_shortList WHERE (((tbl_shortList.propertyId)="&prop&") and ((tbl_shortList.customerId)="&customerId&"));"
		'query = deletequery
		'response.write ("<br/>deleteQuery "&action &request.querystring("prop"))
		conn.execute deletequery
		msg="deleteSuccess"
	else
		Response.Write("Inserting")
		selectQuery = "Select * FROM tbl_shortList WHERE (((tbl_shortList.propertyId)="&prop&") and ((tbl_shortList.customerId)="&customerId&"));"
		rs.open selectQuery, conn,1,2
		i=rs.RecordCount
		if i = 0 then 
			addQuery = "Insert Into tbl_shortList(propertyId, customerId) values("&prop&", "&customerId&");"
			'query = addQuery
			conn.execute addQuery
			msg="insertSuccess"
		else 
			msg="alreadyExists"
		end if
		rs.close
		
	end if 
	Response.Write(prop & "<br>" &action & "<br>" &customerId)
	'rs.close
	conn.close
	response.write(msg)
end if


'Response.Redirect("default.asp?msg=success")
Response.Redirect(sScriptName&"?msg="&msg)

%>