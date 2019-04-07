<!-- #Include File = "cfg_config.asp" -->
<%
set flatFetchRS = server.createObject("ADODB.recordset")
set flatFetchConn = conn
propId = 1				
flatFetchQuery = "SELECT tbl_flats.ID, tbl_flats.flatNumber, tbl_flats.Floor, tbl_flats.flatConfiguration, tbl_flats.Wing, tbl_flats.propertyId, tbl_flatConfiguration.flatConfiguration, tbl_flatConfiguration.floorPlan, tbl_flatConfiguration.BuildArea, tbl_flatConfiguration.faceDirection,  tbl_flatConfiguration.primaryBasePrice, tbl_flatConfiguration.propertyId FROM tbl_flats INNER JOIN tbl_flatConfiguration ON tbl_flatConfiguration.ID = tbl_flats.flatConfiguration WHERE tbl_flatConfiguration.propertyId = 1;"
Response.Write("Ready")
flatFetchRS.open flatFetchQuery, flatFetchConn
do until flatFetchRS.EOF
%>

<option value="<%Response.Write(flatFetchRS.fields(0))%>">
	Floor : <%Response.Write(flatFetchRS.fields(2))%> , 
	Flat : <%Response.Write(flatFetchRS.fields(1))%> 
	| Area : <%Response.Write(flatFetchRS.fields(8))%> Sq.Ft 
	| Rs. : <%Response.Write(flatFetchRS.fields(10))%>
</option>
<%
flatFetchRS.MoveNext
loop
flatFetchRS.close
flatFetchConn.close
%>
<!-- #Include File = "cfg_config.asp" -->
<%

'propId = request.querystring("prop")
i=0
query = "SELECT tbl_property.ID, tbl_property.developerId, tbl_property.propertyName, tbl_developer.developerCompanyName, tbl_property.propertyType, tbl_property.propertyPlotNumber, tbl_property.propertyLocality, tbl_property.propertyCity, tbl_property.propertyState, tbl_property.propertyPincode, tbl_property.views FROM tbl_developer INNER JOIN tbl_property ON tbl_developer.developerId = tbl_property.developerId WHERE (((tbl_property.ID) = "&propId&"));"
rs.open query, conn
Response.Write(query)
if not rs.EOF then
%>
console.log('address')
Address = {
propertyId : <% Response.Write(rs.fields(0)) %>,
developerId : <% Response.Write(rs.fields(1)) %>,
propertyName : <% Response.Write(rs.fields(2)) %>,
developerCompanyName : <% Response.Write(rs.fields(3)) %>,
propertyType : <% Response.Write(rs.fields(4)) %>,
propertyPlotNumber : <% Response.Write(rs.fields(5)) %>,
propertyLocality : <% Response.Write(rs.fields(6)) %>,
propertyCity : <% Response.Write(rs.fields(7)) %>,
propertyState : <%Response.Write(rs.fields(8))%>, 
propertyPincode : <%Response.Write(rs.fields(9))%>,
views : <%Response.Write(rs.fields(10))%>,
propertyId : <%Response.Write(rs.fields(11))%>
}

<%
'Response.Write("AA")
'i=i+1
'rs.MoveNext
end if
Response.Write("AAB")
rs.close
conn.close
%>

Flats
