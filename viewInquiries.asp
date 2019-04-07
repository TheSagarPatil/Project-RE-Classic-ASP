<!-- #Include File = "web_layout_header.asp" -->
<!-- #Include File = "cfg_config.asp" -->
<div class="container containerMain">
		<!-- <div class="col-xs-12 col-lg-10 col-lg-offset-1" style="padding:0px 24px 16px 24px; border-radius:2px; box-shadow: 0px 5px 10px 2px ;">
		-->
		<div class="row">
			<div class="col-xs-12 col-md-8" ><h1 class="card-title-label">Manage Inquiries</h1> </div>
			<div class="col-xs-12 col-md-4 text-right">
				<form name="f1" action="viewInquiries.asp">
					<div class="row">
					<div class="col-xs-9 col-md-7 col-lg-9">
					<input type="text" class="form-control" id="search" name="nm" style="margin-top:20px;"/>
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
					<th>Name</th>
					<th>Property Name</th>
					<th>Date</th>
					<th>Status</th>
					</tr>
					</thead>
					<tbody class="text-center">
<%
nm = request.querystring("Nm")
query = "SELECT tbl_inquiry.customerId, tbl_inquiry.propertyId, tbl_person_1.firstName,   tbl_person_1.lastName, tbl_person_1.phoneNumber, tbl_inquiry.agentId, tbl_person.firstName, tbl_person.lastName, tbl_inquiry.propertyId, tbl_property.propertyName, tbl_inquiry.dateOfInquiry, tbl_inquiry.status FROM tbl_property INNER JOIN (tbl_person INNER JOIN (tbl_person AS tbl_person_1 INNER JOIN tbl_inquiry ON tbl_person_1.ID = tbl_inquiry.customerId) ON tbl_person.ID = tbl_inquiry.agentId) ON tbl_property.ID = tbl_inquiry.propertyId WHERE (((tbl_person_1.firstName) Like '%"&nm&"%')) OR (((tbl_property.propertyName) Like '%"&nm&"%'));"
'Response.Write( query )
rs.open query, conn, 1

do until rs.EOF
%>
	
					<tr>
						<td><a class="btn btn-warning" href="viewInquiry.asp?cust=<%Response.Write(rs.fields(0))%>&prop=<%Response.Write(rs.fields(0))%>"><span class="glyphicon glyphicon-pencil"></span></button></a>
						<!--<td><button class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></button></td>-->
						
						<td><a href="viewInquiry.asp?cust=<%Response.Write(rs.fields(0))%>&prop=<%Response.Write(rs.fields(0))%>"><%Response.Write(rs.fields(2))%>&nbsp; <% Response.Write(rs.fields(3)) %></td>
						<td><% Response.Write(rs.fields(9)) %></td>
						
						<td><% Response.Write(rs.fields(10)) %></td>
						<td><% Response.Write(rs.fields(11)) %></td>
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