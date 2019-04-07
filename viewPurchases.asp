<%
query = "SELECT tbl_property.ID, tbl_property.developerId, tbl_property.propertyName, tbl_developer.developerCompanyName, tbl_property.propertyType, tbl_property.propertyPlotNumber, tbl_property.propertyLocality, tbl_property.propertyCity, tbl_property.propertyState, tbl_property.propertyPincode, tbl_property.views FROM tbl_developer INNER JOIN tbl_property ON tbl_developer.developerId = tbl_property.developerId WHERE (ID = "&propId&")"
rs.open query, conn, 1

%>