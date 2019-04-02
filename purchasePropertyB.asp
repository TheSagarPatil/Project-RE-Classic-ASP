<!-- #Include File = "web_layout_header.asp" -->
<!-- #Include File = "cfg_config.asp" -->

<%
if Session("access")="cust" and not Session("customerId") = "" then
%>
	<div class="container containerMain">
		
		<form name="purchaseForm" method="post" action="generateReciept">
		<div class="col-xs-12 col-lg-10 col-lg-offset-1" style="padding:0px 24px 16px 24px; border-radius:2px; box-shadow: 0px 5px 10px 2px ;">
			<div class="row">
				<div class="col-xs-12"><h3 class="card-title-label" id="propertyTitle"></h3> </div>
				<div class="col-xs-12"><label class="card-promotion-lable" id="developerCompanyName"></label>
				<label class="pull-right"></label>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-6 ImageHolderLarge" style="height:250px; margin-bottom:16px;overflow:hidden; background-image: url('images/props/jpg');">
				</div>
				<div class="col-xs-6">
					<div class="row">
						<div class="col-xs-12">
							<span style="font-weight:bold;">Type : </span>
							<label class="card-description-lable" id="propertyType">,</label>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<span style="font-weight:bold;">Address : </span>
							<label class="card-description-lable" id="propertyAddress">
							</label>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<label class="card-description-lable">
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
							<select name="flatId" style="">
							</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<label for="flatId">Flat Information</label>
							<div class="input-group" id="flatInfo">	
							
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
				<%if Session("customerId") then%>
					<!-- <a id="recieptUrl" class="btn btn-success pull-right" href="reciept.asp?propId=">Confirm Purchase</a>
					-->
					<input class="btn btn-success" type="submit" value="Confirm Purchase"/>
				<%end if%>
				
				</div>
			</div>
		</div>
		</form>
	</div>
	
	<script>
	var flatConfigurations = []
	<!-- #Include File = "cfg_config.asp" -->
	<%
	i=0
	propId = request.querystring("prop")
	set propFetchConn = conn
	set propFetchRS = rs 

	set flatFetchRS = server.createObject("ADODB.recordset")
	set flatFetchConn = conn
	'propId = 1				
	flatFetchQuery = "SELECT tbl_flats.ID, tbl_flats.flatNumber, tbl_flats.Floor, tbl_flats.flatConfiguration, tbl_flats.Wing, tbl_flats.propertyId, tbl_flatConfiguration.flatConfiguration, tbl_flatConfiguration.floorPlan, tbl_flatConfiguration.BuildArea, tbl_flatConfiguration.faceDirection,  tbl_flatConfiguration.primaryBasePrice, tbl_flatConfiguration.propertyId FROM tbl_flats INNER JOIN tbl_flatConfiguration ON tbl_flatConfiguration.ID = tbl_flats.flatConfiguration WHERE tbl_flatConfiguration.propertyId = "&propId&";"
	flatFetchRS.open flatFetchQuery, flatFetchConn

	do until flatFetchRS.EOF 
	%>
	flatConfigurations[<%Response.Write(i)%>] = {Id : <%Response.Write(flatFetchRS.fields(0))%>,
			Floor : <%Response.Write(flatFetchRS.fields(2))%> , 
			Flat : <%Response.Write(flatFetchRS.fields(1))%>,
			Area : <%Response.Write(flatFetchRS.fields(8))%>,
			Price : <%Response.Write(flatFetchRS.fields(10))%>
			}

	<%
	i=i+1
	flatFetchRS.MoveNext
	loop
	flatFetchRS.close
	flatFetchConn.close
	%>
	</script>
	<script>
	<!-- #Include File = "cfg_config.asp" -->
	<%

	'propId = request.querystring("prop")
	i=0
	query = "SELECT tbl_property.ID, tbl_property.developerId, tbl_property.propertyName, tbl_developer.developerCompanyName, tbl_property.propertyType, tbl_property.propertyPlotNumber, tbl_property.propertyLocality, tbl_property.propertyCity, tbl_property.propertyState, tbl_property.propertyPincode, tbl_property.views FROM tbl_developer INNER JOIN tbl_property ON tbl_developer.developerId = tbl_property.developerId WHERE (((tbl_property.ID) = "&propId&"));"
	rs.open query, conn
	'Response.Write(query)
	if not rs.EOF then
	%>
	console.log('address')
	property = {
	propertyId : "<% Response.Write(rs.fields(0)) %>",
	developerId : "<% Response.Write(rs.fields(1)) %>",
	propertyName : "<% Response.Write(rs.fields(2)) %>",
	developerCompanyName : "<% Response.Write(rs.fields(3)) %>",
	propertyType : "<% Response.Write(rs.fields(4)) %>",
	propertyPlotNumber : "<% Response.Write(rs.fields(5)) %>",
	propertyLocality : "<% Response.Write(rs.fields(6)) %>",
	propertyCity : "<% Response.Write(rs.fields(7)) %>",
	propertyState : "<%Response.Write(rs.fields(8))%>", 
	propertyPincode : "<%Response.Write(rs.fields(9))%>",
	views : "<%Response.Write(rs.fields(10))%>"

	}

	<%
	'Response.Write("AA")
	'i=i+1
	'rs.MoveNext
	end if

	rs.close
	conn.close
	%>
	</script>
	<script>
	<!-- #Include File = "cfg_config.asp" -->
	<%

	'propId = request.querystring("prop")
	i=0
	query = "SELECT tbl_inquiry.customerId, tbl_inquiry.agentId, tbl_inquiry.propertyId, tbl_inquiry.dateOfInquiry, tbl_inquiry.status FROM tbl_inquiry WHERE (((tbl_inquiry.customerId)="&Session("customerId")&") AND ((tbl_inquiry.propertyId)="&propId&") AND ((tbl_inquiry.status)='pending')) ORDER BY tbl_inquiry.dateOfInquiry;"
	rs.open query, conn
	'Response.Write(query)
	if not rs.EOF then
	%>
	console.log('address')
	agentInfo = {
	customerId : "<% Response.Write(rs.fields(0)) %>",
	agentId : "<% Response.Write(rs.fields(1)) %>",
	propertyId : "<% Response.Write(rs.fields(2)) %>",
	dateOfInquiry : "<% Response.Write(rs.fields(3)) %>",
	status : "<% Response.Write(rs.fields(4)) %>"
	}

	<%
	'Response.Write("AA")
	'i=i+1
	'rs.MoveNext
	end if

	rs.close
	conn.close
	%>
	</script>
	
	<script>
	/*
	name="agentId"
	id="DeveloperId"
	id="DeveloperName"
	id="propertyId"
	id="propertyName"
	id="propertyType"
	id="propertyAddress"
	*/
	$('[name="agentId"]').val(agentInfo.agentId);
	$('[id="DeveloperId"]').html(property.developerId);
	$('[id="DeveloperName"],[id="developerCompanyName"]').html(property.developerCompanyName);
	$('[id="propertyId"]').html(property.propertyId);
	$('[id="propertyName"], [id="propertyTitle"]').html(property.propertyName);
	$('[id="propertyType"]').html(property.propertyType);
	$('[id="propertyAddress"]').html(property.propertyName +
		", " + property.propertyPlotNumber + 
		", " + property.propertyLocality + 
		", " + property.propertyCity + 
		", " + property.propertyState + 
		", " + property.propertyPincode );
	
	for(i=0; i<flatConfigurations.length;i++){
		$('[name="flatId"]').append("<option value="+flatConfigurations[i].Id+
		">"+
		"Flat No : " + flatConfigurations[i].Flat +
		"| Carpet Area : " +flatConfigurations[i].Area + 
		"| Floor No : " +flatConfigurations[i].Floor +
		"| Price : " +flatConfigurations[i].Price +
		"</option>")
	}
	$('[name="flatId"]').on('change', function() {
		i = this.value;
	  $("[id='flatInfo']").html("<b>Flat No :</b>" + flatConfigurations[i].Flat +
		"<br/><b>Flat Floor Location: </b>" + flatConfigurations[i].Floor + 
		"<br/><b>Flat Carpet Area : </b>" + flatConfigurations[i].Area + 
		"<br/><b>Flat Base Price : </b>" + flatConfigurations[i].Price +
		"<br/><br/><b>Registration Fee : </b> Rs. 25000/- (flat fee)" + 
		"<br/><b>GST : </b> Rs." + flatConfigurations[i].Price * (3/100) + "@3%" + 
		"<br/><b>Agent Commission : </b> Rs." + flatConfigurations[i].Price * (2/100) + "@2%" + 
		
		"<br/><b>Grand Total :  Rs." + (flatConfigurations[i].Price + 
			flatConfigurations[i].Price * (3/100) + 
			flatConfigurations[i].Price * (2/100) + 25000) + "/-</b>" 
	  );
	});
	</script>
<%end if%>

<!-- #Include File = "web_layout_footer.asp" -->