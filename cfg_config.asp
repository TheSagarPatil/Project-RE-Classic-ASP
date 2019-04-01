<%
set conn=server.createObject("ADODB.connection")
set rs=server.createObject("ADODB.recordset")

'path=Server.MapPath("/DB2_2k3F.mdb")
path="D:/db/DB2_2k3F.mdb"
Response.Write path
conn.ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="+path+";"
conn.open
'nm = request.form("aa")
'rs.open "rs.open "SELECT tbl_person.ID, tbl_person.firstName, tbl_person.lastName FROM tbl_person WHERE (((tbl_person.ID)=1));""
'rs.open "SELECT Table1.ID, Table1.firstName FROM Table1 WHERE (((Table1.ID)=1));", conn
'if not rs.eof then
	'Response.Write  "<br/>" & vbcrlf &_ 
	'rs.Fields(f1) & "<br/>" & "Logged in"
'else 
	'Response.Write "Fail"
'end if
'rs.close
'conn.close

Response.Write "{message:Hello, world!}" 
%>