<!-- #Include File = "web_layout_header.asp" -->
<!-- #Include File = "cfg_config.asp" -->
<div class="container containerMain">
	<div class="row">
		<div class="col-xs-12">
		<h1><b>Purchase Confirmation</b></h1>
		</div>
	</div>
		
<%
	customerId = Session("customerId")
	agentId=request.querystring("agentId")
	flatId=request.querystring("flatId")

	i=0
	propId = request.querystring("prop")
	set flatFetchRS = server.createObject("ADODB.recordset")
	set flatFetchConn = conn
	'propId = 1				
	flatFetchQuery = "SELECT tbl_person.ID, tbl_person.firstName, tbl_person.lastName, tbl_person.email, tbl_person.phoneNumber FROM tbl_customer INNER JOIN tbl_person ON tbl_customer.customerId = tbl_person.ID WHERE (((tbl_person.ID)="&customerId&"));"

	flatFetchRS.open flatFetchQuery, flatFetchConn

	do until flatFetchRS.EOF 
	%>
	<div class="row">
		<div class="col-xs-12">
		<h2>Customer Information</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 ">
			Id :
			<%Response.Write(flatFetchRS.fields(0))%>
		</div>
		
		<div class="col-xs-12 col-sm-6 ">
			FirstName : 
			<%Response.Write(flatFetchRS.fields(1))%>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 ">
			LastName : 
			<%Response.Write(flatFetchRS.fields(2))%>
		</div>
		<div class="col-xs-12 col-sm-6 ">
			email : 
			<%Response.Write(flatFetchRS.fields(3))%>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 ">
			phoneNumber : 
			<%Response.Write(flatFetchRS.fields(4))%>
		</div>
	</div>
		

	<%
	i=i+1
	flatFetchRS.MoveNext
	loop
	flatFetchRS.close
	flatFetchConn.close

%>
<!-- #Include File = "cfg_config.asp" -->
<%

	i=0
	Response.Write("Property Information")
	'propId = 1				
	query = "SELECT tbl_property.ID, tbl_property.developerId, tbl_property.propertyName, tbl_property.propertyType, tbl_property.propertyPlotNumber, tbl_property.propertyLocality, tbl_property.propertyCity, tbl_property.propertyState, tbl_property.propertyPincode, tbl_developer.developerCompanyName FROM tbl_developer INNER JOIN tbl_property ON tbl_developer.developerId = tbl_property.developerId WHERE (((tbl_property.ID)="&propId&"));"
	rs.open query, conn
	'Response.Write(query)
	do until rs.EOF 
	%>
	
	<div class="row">
		<div class="col-xs-12">
		<h2>Property Information</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 ">
			ID 
			<%Response.Write(rs.fields(0))%>
		</div>
		<div class="col-xs-12 col-sm-6 ">
			developerId, 
			<%Response.Write(rs.fields(1))%>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 ">
			propertyName, 
			<%Response.Write(rs.fields(2))%>
		</div>
		<div class="col-xs-12 col-sm-6 ">
			propertyType, 
			<%Response.Write(rs.fields(3))%>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 ">
			propertyPlotNumber, 
			<%Response.Write(rs.fields(4))%>
		</div>
		<div class="col-xs-12 col-sm-6 ">
			propertyLocality, 
			<%Response.Write(rs.fields(5))%>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 ">
			propertyCity, 
			<%Response.Write(rs.fields(6))%>
		</div>
		<div class="col-xs-12 col-sm-6 ">
			propertyState, 
			<%Response.Write(rs.fields(7))%>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 ">
			propertyPincode, 
			<%Response.Write(rs.fields(8))%>
		</div>
		<div class="col-xs-12 col-sm-6 ">
			developerCompanyName 
			<%Response.Write(rs.fields(9))%>
		</div>
	</div>
	
		

	<%
	i=i+1
	rs.MoveNext
	loop
	rs.close
	conn.close

%>
<!-- #Include File = "cfg_config.asp" -->
<%

	i=0
	'Response.Write("Flat Details")
	'propId = 1				
	query = "SELECT tbl_flats.ID, tbl_flats.flatNumber, tbl_flats.Floor, tbl_flats.flatConfiguration, tbl_flats.Wing, tbl_flats.propertyId, tbl_flatConfiguration.flatConfiguration, tbl_flatConfiguration.floorPlan, tbl_flatConfiguration.BuildArea, tbl_flatConfiguration.faceDirection,  tbl_flatConfiguration.primaryBasePrice, tbl_flatConfiguration.propertyId FROM tbl_flats INNER JOIN tbl_flatConfiguration ON tbl_flatConfiguration.ID = tbl_flats.flatConfiguration WHERE tbl_flats.Id = "&flatId&";"
	rs.open query, conn
	'Response.Write(query)
	do until rs.EOF 
	Price = rs.fields(10)
	RegistrationFee = 25000
	GST = 1
	if(price > 4500000) then 
		GST = Price * (3/100)
		GSTRate = 3
	else 
		GST = Price * (1/100)
		GSTRate = 1
	end if 
	AgentCommission = Price * (2/100) 
	GrandTotal = (Price + GST + AgentCommission + RegistrationFee)
	%>
	
	<div class="row">
		<div class="col-xs-12">
		<h2>Flat Configuration</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 ">
			Id : 
			<%Response.Write(rs.fields(0))%>
		</div>
		<div class="col-xs-12 col-sm-6 ">
			Floor : 
			<%Response.Write(rs.fields(2))%> 
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 ">
			Flat : 
			<%Response.Write(rs.fields(1))%>
		</div>
		<div class="col-xs-12 col-sm-6 ">
			Area : 
			<%Response.Write(rs.fields(8))%>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
		<h2>Payment Information</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 ">
			Base Price : 
			Rs. <%Response.Write(rs.fields(10))%>
		</div>
		<div class="col-xs-12 col-sm-6 ">
			Registration Fee (Flat fee): 
			Rs. <%Response.Write(RegistrationFee)%> /- 
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 ">
			GST  @<%Response.Write(GSTRate)%>% : 
			Rs. <%Response.Write(GST)%>/-
		</div>
		<div class="col-xs-12 col-sm-6 ">
			AgentCommission @3% : 
			Rs. <%Response.Write(AgentCommission)%>/- 
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 ">
			Grand Total : 
			Rs. <%Response.Write(GrandTotal)%>/- 
		</div>
	</div>
	<br>
	<br>
	<div class="row">
				<div class="col-xs-6 col-md-4">
					<div class="form-group">
						<div class="input-group">	
						<button class="btn btn-primary" type="Print" onclick="window.print();" target="_blank" >Print</button>
						</div>
					</div>
				</div>
</div>
		

	<%
	i=i+1
	rs.MoveNext
	loop
	rs.close
	conn.close

%>
<!-- #Include File = "cfg_config.asp" -->
<%
	
	sldquery = "select flatId, customerId from tbl_flatSale where customerId = "&customerId&"; "
	'Response.Write("query" & sldquery)
	rs.open sldquery, conn
	
	flatSoldFlag = false
	if not rs.EOF then
		if rs.fields(0) = flatId then 
			flatSoldFlag = true
		else
			flatSoldFlag = false
		end if
	end if
	if flatSoldFlag = true then
%>
<!-- #Include File = "cfg_config.asp" -->
<%
	
		customerId = Session("customerId")
		agentId=request.querystring("agentId")
		flatId=request.querystring("flatId")
		propId = request.querystring("prop")
		i=0
		
		set purchConn = conn
		purchQuery = "Insert Into tbl_flatSale values ("&flatId&", "&agentId&","&RegistrationFee&", "&GST&", "&AgentCommission&", "&Price&","& customerId &");"
		'Response.Write("purchQuery")
		purchConn.execute purchQuery
		Response.Write("Purchase is Confirmed") 
%>
<!-- #Include File = "cfg_config.asp" -->
<%
		customerId = Session("customerId")
		agentId=request.querystring("agentId")
		flatId=request.querystring("flatId")
		propId = request.querystring("prop")
		i=0
		
		set purchConn = conn
		purchQuery = "UPDATE tbl_flats set markedAsSold = 1 where Id = "&flatId&";"
		purchConn.execute purchQuery
		Response.Write("<br/>Purchase has been double verified") 
	else 
		Response.Write("Flat is sold to you. The sale is confirmed. Please take printout and visit our office for further process.")
	end if
%>
</div>
<style>
@media only print
{
    [type="print"]{
		display:none !important;
	}
	#Footer{display: none !important;}
}
.label{
font-weight:bold;
}

</style>
<!-- #Include File = "web_layout_footer.asp" -->