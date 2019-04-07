<!-- #Include File = "web_layout_header.asp" -->
<script>
//result = prompt('Enter your pincode', 411019);
//pincode = window.location.search.substring(1).split('=')[1];
//if(window.location.search.substring(1).split('=')[0] == "msg"){
//	alert("window.location.search.substring(1).split('=')[1]")
//}
</script>
	<div class="container containerMain" id="exploreProps">
		<div class="row ">
			<div class="col-xs-12 col-sm-6 col-md-7 col-lg-7">
				<h1>View Shortlist</h1>
			</div>
		</div>
		<div class="row hidden">
			<div class="col-xs-12">
				<form name="exploreProps" method="get" action="viewShortlist.asp">
					<div class="row">
						<div class="col-xs-12 col-sm-7  col-md-6 col-lg-6">
							<div class="input-group" style="margin-top:5px">	
							<input type="text" class="form-control searchBox" name="search" Placeholder="Search by Property Name, Developer Name, Locality"/>
							</div>
						</div>
						<div class="col-xs-7 col-sm-3 col-md-4 col-lg-3 hidden">
							<div class="input-group" style="margin-top:5px">	
								<input type="text" class="form-control searchBox" name="location" Placeholder="Enter Location"/>
							</div>
						</div>
						<div class="col-xs-7 col-sm-3 col-md-4 col-lg-3 hidden">
							<div class="input-group " style="margin-top:5px">	
								<select name="ApartmentType">
									<option selected>Select One</option>
									<option>Apartment</option>
									<option>Row-House</option>
									<option>Banglow</option>
								</select>
							</div>
						</div>
						<div class="col-xs-5 col-sm-2 col-md-2 col-lg-3">
							<div class="input-group" style="">	
							<input type="submit" class="btn btn-primary"value="SUBMIT"/>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="row flex-wrapper" style="overflow-x:auto;">
			<div class="card-container">


<!-- #Include File="cfg_config.asp"-->
<%
if Session("customerId") = "" then
%>
You must <A href="login.asp">login</a> before accessing this content 
<%
else
	i = 0
	customerId = Session("customerId")
	'response.write in_par1 & in_par2 & "Par Received"
	query = "SELECT Top 20 tbl_shortList.propertyId, tbl_shortList.customerId, tbl_property.propertyName, tbl_property.propertyType, tbl_property.propertyPlotNumber, tbl_property.propertyLocality, tbl_property.propertyCity, tbl_property.propertyPincode FROM tbl_property INNER JOIN tbl_shortList ON tbl_property.ID = tbl_shortList.propertyId WHERE (((tbl_shortList.customerId)="&customerId&"));"
	rs.open query, conn
	do until rs.EOF
		'Response.Write("data aquired")
		%>
					<div class="flex-cards col-xs-12 col-sm-6 col-md-4 col-xs-12" style="min-width:300px;">
						<div class="jumbotron pricing-card card">
							<div class="row">
								<div class="col-xs-12"><label class="card-title-label"><%Response.Write(rs.Fields(2))%></label> </div>
								
							</div>
							<div class="row">
								<div class="imageHolder" style="background:url('images/props/<%Response.Write(rs.Fields(0))%>.jpg'); background-size: cover;">
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12"><label class="card-description-lable">Type : <% Response.Write(rs.Fields(3)) %></label></div>
								<div class="col-xs-12"><label class="card-description-lable">Location : <% Response.Write(rs.Fields(4)) %>,&nbsp 
									<%Response.Write(rs.Fields(5)) %>&nbsp 
									<% Response.Write(rs.Fields(6)) %>&nbsp 
									<% Response.Write(rs.Fields(7)) %> 
									</label>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<form name="f_shortlist<% Response.Write(rs.Fields(0)) %>" action="action_addToShortlist.asp">
										<input type="hidden" name="prop" value="<% Response.Write(rs.Fields(0)) %>"/>
										<input type="hidden" name="action" value="del"/>
										<input type="hidden" name="rdrPath" value=" <%Response.Write(Request.ServerVariables("SCRIPT_NAME")) %>"/>
										<%if Session("access") = "cust" then%>
										<button class="btn btn-danger col-xs-12" type="submit">Remove From Shortlist</button>
										<%end if%>
										<a class="btn btn-success pull-right col-xs-12" style="margin-top:5px;" href="ViewProperty.asp?prop=<% Response.Write(rs.Fields(0)) %>">View</a>
									</form>
									
								</div>
							</div>
						</div>
					</div>
		<%
		i=i+1
		rs.MoveNext
	loop

	if i = 0 then
		rs.close
		conn.close
		'response.write "{msg: No Records Found}"

	Else
		rs.close
		conn.close
		'response.write "{msg: Records Found}"
	end if	
end if
%>


			</div>
		</div>
	</div>

<!--
	pincode = request.form("pincode")
	if pincode Is Nothing then
	pincode = 411019
	end if
	pincode2 = pincode+1
	pincode3 = pincode-1
	query = "SELECT tbl_property.ID, tbl_property.developerId, tbl_property.propertyName, tbl_developer.developerCompanyName, tbl_property.propertyType, tbl_property.propertyPlotNumber, tbl_property.propertyLocality, tbl_property.propertyCity, tbl_property.propertyState, tbl_property.propertyPincode, tbl_property.views FROM tbl_developer INNER JOIN tbl_property ON tbl_developer.developerId = tbl_property.developerId WHERE ( ( (tbl_property.propertyPincode)='"&pincode&"') OR ( (tbl_property.propertyPincode)='"&pincode2&"') OR ( (tbl_property.propertyPincode)='"&pincode3&"') );"
-->
<!-- #Include File = "web_layout_footer.asp" -->
