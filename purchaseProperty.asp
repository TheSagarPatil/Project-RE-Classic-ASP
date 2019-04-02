<!-- #Include File = "web_layout_header.asp" -->
<!-- #Include File = "cfg_config.asp" -->
<%
set flatFetchConn = conn
set flatFetchRS = rs 
propId = request.querystring("prop")
i=0
query = "SELECT tbl_property.ID, tbl_property.developerId, tbl_property.propertyName, tbl_developer.developerCompanyName, tbl_property.propertyType, tbl_property.propertyPlotNumber, tbl_property.propertyLocality, tbl_property.propertyCity, tbl_property.propertyState, tbl_property.propertyPincode, tbl_property.views FROM tbl_developer INNER JOIN tbl_property ON tbl_developer.developerId = tbl_property.developerId WHERE (ID = "&propId&")"

'Response.Write( query )
rs.open query, conn, 1

if not rs.EOF then
%>
	<div class="container containerMain">
		<div class="col-xs-12 col-lg-10 col-lg-offset-1" style="padding:0px 24px 16px 24px; border-radius:2px; box-shadow: 0px 5px 10px 2px ;">
		<div class="row">
			<div class="col-xs-12"><h3 class="card-title-label"><% Response.Write(rs.fields(2)) %></h3> </div>
			<div class="col-xs-12"><label class="card-promotion-lable"><% Response.Write(rs.fields(3)) %></label>
			<label class="pull-right"><%Response.Write(rs.fields(10))%> Views</label>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-6 ImageHolderLarge" style="height:250px; margin-bottom:16px;overflow:hidden; background-image: url('images/props/<% Response.Write(rs.fields(0)) %>.jpg');">
			</div>
			<div class="col-xs-6">
				<div class="row">
					<div class="col-xs-12">
						<span style="font-weight:bold;">Type : </span>
						<label class="card-description-lable"><% Response.Write(rs.fields(4)) %>,</label>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<span style="font-weight:bold;">Address : </span>
						<label class="card-description-lable">
						<% Response.Write(rs.fields(4)) %>,
						<% Response.Write(rs.fields(5)) %>,
						<% Response.Write(rs.fields(6)) %>
						</label>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<label class="card-description-lable">
						<%Response.Write(rs.fields(7))%>, 
						<%Response.Write(rs.fields(9))%>
						</label>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<label for="pwd">Agent Number</label>
						<div class="input-group">	
						<input type="text" class="form-control" name="agentId" placeholder="Enter Agent ID" value="1"/>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<label for="flatId">Select a flat</label>
						<div class="input-group">	
						<select style="">
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
							FloorNo: <%Response.Write(flatFetchRS.fields(2))%> , 
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
						</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<label for="pwd">Agent Number</label>
						<div class="input-group">
						<input type="text" class="form-control" name="agentId" placeholder="Enter Agent ID" value="1"/>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			
		</div>
		<div class="row">
			<div class="col-xs-12">
			<%
			if Session("customerId") then
			%>
			<a class="btn btn-success pull-right" propId="0" href="reciept.asp?propId=<%Response.Write(rs.fields(0))%>">Confirm Purchase</a>
			<%
			end if
			%>
			
			</div>
		</div>
		</div>
	</div>
	
<%
Response.Write("AA")
'i=i+1
'rs.MoveNext
end if
Response.Write("AAB")
'rs.close

'conn.close

%>

<!-- #Include File = "web_layout_footer.asp" -->
<script>
$document.ready(function(){
	
})
</script>