<!-- #Include File="cfg_config.asp" -->
<%

fname  = request.Form("fname")
lname = request.Form("lname")
phnumber = request.Form("phnumber")
email = request.Form("email")
pannumber = request.Form("pannumber")
address = request.Form("address")
password = request.Form("password")
selectcity = request.Form("selectcity")
select_State = request.Form("select_State")
pan_code = request.Form("pan_code")
landmark = request.Form("landmark")
gender = request.form("gender")
'response.write("<br/>"&address&"<br/>")


query ="Insert Into tbl_person(firstName,lastName,email,passwordHash,pan,phoneNumber,city,state,pincode,landmark,address,gender) Values ('"&fname&"', '"&lname&"','"&email&"', '"&password&"', '"&pannumber&"','"&phnumber&"', '"&selectcity&"', '"&select_State&"','"&pan_code&"' , '"&landmark&"','"&address&"','"&gender&"');"
'query = "Insert Into tbl_person(firstName,lastName,email,password,pan,phoneNumber,city,state,pincode,landmark,address,gender) Values ('asf','saf','Swapnil@gmail.com', '1234', 'DSGSDG','1232141241', 'asfasf', 'Telangana','124124' , 'dsfadfad','adsfaadf','Male')"
'query = "Insert Into tbl_person(firstName,lastName,email,passwordHash,pan)values('ABCD','saf','Swapnil@gmail.com','AA','BB')"
'query = "Insert Into tbl_person(firstName,lastName,email,passwordHash,pan,phoneNumber,city,state,pincode,landmark,address,gender,apartment,flatNumber,propertyNumber,town_village) Values ('asf', 'saf','Swapnil@gmail.com', '1234', 'DSGSDG','1232141241', 'asfasf', 'Telangana','124124' , 'dsfadfad','adsfaadf','Male','','','','')"
'query = query + " select IdentityInsert=@@identity"
'query = query + " set nocount off"
'Response.Write(conn)
Response.Write(query)
on error resume next
'conn.Execute query,recaffected
conn.Execute(query)

if err <> 0 then
	Response.Write("<br/>FAIL"&err&"<br/>REC"&recaffected)
	msg="checkEmailAddress"
else
	Respose.Write("<br/>success"&recaffected)
end if
Response.Write("success")

<!-- #Include File="cfg_config.asp" -->

rs.open "select max(id) as cid from tbl_person", conn
id = rs.Fields(0)

'Response.Write("<br/>"&id)
'Response.Write("<br/>Success")
Response.Write ("<br/>Identity" & id)

Response.Redirect("action_RegCustomer.asp?id="&id)
'Response.Redirect("Login.asp?msg="&msg)
%>