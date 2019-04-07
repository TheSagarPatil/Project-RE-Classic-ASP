<!-- #Include File = "web_layout_header.asp" -->
<!-- #Include File = "cfg_config.asp" -->
<div class="container containerMain">
		<!-- <div class="col-xs-12 col-lg-10 col-lg-offset-1" style="padding:0px 24px 16px 24px; border-radius:2px; box-shadow: 0px 5px 10px 2px ;">
		-->
		<div class="row">
			<div class="col-xs-12 col-md-8" ><h1 class="card-title-label">Manage Customers</h1> </div>
			<div class="col-xs-12 col-md-4 text-right">
				<form name="f1" action="viewCustomers.asp">
					<div class="row">
					<div class="col-xs-9 col-md-7 col-lg-9">
					<input type="text" class="form-control" id="search" name="custName" style="margin-top:20px;" placeholder="Search by First Name" />
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
					<th>Customer Name</th>
					<th>Email</th>
					<th>Phone</th>
					<th>City</th>
					</tr>
					</thead>
					<tbody class="text-center">
<%
custName = request.querystring("custName")
query = "SELECT tbl_person.ID, tbl_person.firstName, tbl_person.lastName, tbl_person.email, tbl_person.pan, tbl_person.phoneNumber, tbl_person.city FROM tbl_person INNER JOIN tbl_customer ON tbl_customer.customerId = tbl_person.Id Where tbl_person.firstName like '%"&custName&"%';"
'Response.Write( query )
rs.open query, conn, 1

do until rs.EOF
%>
	
					<tr>
						<td><a class="btn btn-warning" href="viewcustomer.asp?cust=<% Response.Write(rs.fields(0)) %>"><span class="glyphicon glyphicon-pencil"></span></button></a>
						<!--<td><button class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></button></td>-->
						
						<td><a href="viewCustomer.asp?cust=<% Response.Write(rs.fields(0)) %>"> <% Response.Write(rs.fields(1)) %>&nbsp;<% Response.Write(rs.fields(2)) %></td>
						<td><% Response.Write(rs.fields(3)) %></td>
						<td><% Response.Write(rs.fields(5)) %></td>
						<td><% Response.Write(rs.fields(6)) %></td>
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