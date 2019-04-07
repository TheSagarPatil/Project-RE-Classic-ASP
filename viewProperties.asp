<!-- #Include File = "web_layout_header.asp" -->
<!-- #Include File = "cfg_config.asp" -->
<div class="container containerMain">
		<!-- <div class="col-xs-12 col-lg-10 col-lg-offset-1" style="padding:0px 24px 16px 24px; border-radius:2px; box-shadow: 0px 5px 10px 2px ;">
		-->
		<div class="row">
			<div class="col-xs-12 col-md-8" ><h1 class="card-title-label">Manage Properties</h1> </div>
			<div class="col-xs-12 col-md-4 text-right">
				<form name="f1" action="viewProperties.asp">
					<div class="row">
					<div class="col-xs-9 col-md-7 col-lg-9">
					<input type="text" class="form-control" id="search" name="searchStr" style="margin-top:20px;"/>
					</div>
					<div class="col-xs-3 col-md-5 col-lg-3">
					<input type="submit" class="btn btn-primary"  value="Search" style="margin-top:17px;"/>
					</div>
					</div>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12" style="overflow-x:scroll;">
				<table style="min-width:100%;">
					<thead><tr>
					<th >Action</th>
					<th>Property Name</th>
					<th>Developer Name</th>
					<th>Type</th>
					<th>Locality</th>
					<th>City</th>
					<th>Pin Code</th>
					</tr>
					</thead>
					<tbody class="text-center">
<%
searchStr = request.querystring("searchStr")
query = "SELECT tbl_property.ID, tbl_property.developerId, tbl_property.propertyName, tbl_developer.developerCompanyName, tbl_property.propertyType, tbl_property.propertyPlotNumber, tbl_property.propertyLocality, tbl_property.propertyCity, tbl_property.propertyState, tbl_property.propertyPincode, tbl_property.views FROM tbl_developer INNER JOIN tbl_property ON tbl_developer.developerId = tbl_property.developerId WHERE ((tbl_property.propertyName like '%"&searchStr&"%') )"
'query = "SELECT tbl_property.ID, tbl_property.developerId, tbl_developer.developerCompanyName, tbl_property.propertyType, tbl_property.propertyLocality, tbl_property.propertyCity, tbl_property.propertyState, tbl_property.propertyPincode, tbl_property.propertyName FROM tbl_developer INNER JOIN tbl_property ON tbl_developer.developerId = tbl_property.developerId WHERE (((tbl_developer.developerCompanyName) Like '%"&searchStr&"%') Or ((tbl_property.propertyName) Like '%"&searchStr&"%'));"
'Response.Write( query )
rs.open query, conn, 1

do until rs.EOF
%>
	
					<tr>
						<td><a class="btn btn-warning" ><span class="glyphicon glyphicon-pencil"></span></button></a>
						<!--<td><button class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></button></td>-->
						
						<td><a href="viewProperty.asp?prop=<% Response.Write(rs.fields(0)) %>"><% Response.Write(rs.fields(2)) %></td>
						
						<td><% Response.Write(rs.fields(3)) %></td>
						<td><% Response.Write(rs.fields(4)) %></td>
						
						<td><% 'Response.Write(rs.fields(6)) %></td>
						<td><% 'Response.Write(rs.fields(7)) %></td>
						<td><% 'Response.Write(rs.fields(6)) %></td>
					</tr>
					
	
<%
i=i+1
rs.MoveNext
loop
if i = 0 then
%>
<tr><td colspan=6 class="text-center">No Records found</td></tr>
<%
end if 
rs.close
conn.close

%>
				</tbody>
				</table>
			</div>
			</div>
		</div>
	</div>

<!-- #Include File = "web_layout_footer.asp" -->