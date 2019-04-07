<!-- #Include File = "web_layout_header.asp" -->
<script>
//result = prompt('Enter your pincode', 411019);
//pincode = window.location.search.substring(1).split('=')[1];
/*
if(window.location.search.substring(1).split('=')[0] == "msg"){
	alert("window.location.search.substring(1).split('=')[1]")
}*/
</script>
<div class="container " id="aa" style="height:200px !important;overflow:hidden;margin-top:60px;">
	<div class="w3-content w3-display-container" style="max-width:800px">
	  <img class="mySlides" src="images/props/1.jpg" style="width:100%">
	  <img class="mySlides" src="images/props/2.jpg" style="width:100%">
	  <img class="mySlides" src="images/props/3.jpg" style="width:100%">
	  <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width:100%">
		<div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
		<div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
		<span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
		<span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
		<span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
	  </div>
	</div>

</div>
	<div class="container containerMain" id="exploreProps">
		<div class="row ">
			<div class="col-xs-12 col-sm-6 col-md-7 col-lg-7">
				<h1>Explore Properties</h1>
			</div>
		</div>
		<div class="row ">
			<div class="col-xs-12">
				<form name="exploreProps" method="get" action="default.asp">
					<div class="row">
						<div class="col-xs-12 col-sm-7  col-md-6 col-lg-6">
							<div class="input-group" style="margin-top:5px">	
							<input type="text" class="form-control searchBox" name="search" Placeholder="Search by Property Name, Developer Name, Locality"/>
							</div>
						</div>
						<div class="col-xs-7 col-sm-3 col-md-4 col-lg-3">
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
in_par1 = request.querystring("location")
in_par2 = request.querystring("search")
if in_par1 = "" then
'in_par1 = 411019
end if 
i = 0
'response.write in_par1 & in_par2 & "Par Received"
query = "SELECT top 5 tbl_property.ID, tbl_property.propertyName, tbl_property.propertyType, tbl_property.propertyLocality, tbl_property.propertyCity, tbl_property.propertyPincode, tbl_developer.developerId, tbl_developer.developerCompanyName FROM tbl_developer INNER JOIN tbl_property ON tbl_developer.developerId = tbl_property.developerId WHERE (((tbl_developer.developerCompanyName) LIKE '%"&in_par2&"%') OR ((tbl_property.propertyPincode)='"&in_par1&"'));"
rs.open query, conn, 1,2
do until rs.EOF
	'Response.Write(rs.Fields(0))
	%>
		<div class="flex-cards col-xs-12 col-sm-6 col-md-4 col-xs-12">
			<div class="jumbotron pricing-card card">
				<div class="row">
					<div class="col-xs-12"><label class="card-title-label"><%Response.Write(rs.Fields(1))%></label> </div>
					<div class="col-xs-12"><label class="card-promotion-lable"><%Response.Write(rs.Fields(3))%></label></div>
				</div>
				<div class="row">
					<div class="imageHolder" style="background:url('images/props/<%Response.Write(rs.Fields(0))%>.jpg'); background-size:cover;">
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12"><label class="card-description-lable">Type : <% Response.Write(rs.Fields(2)) %></label></div>
					<div class="col-xs-12"><label class="card-description-lable">Location : <% Response.Write(rs.Fields(3)) %>,&nbsp 
						<%Response.Write(rs.Fields(4)) %>&nbsp 
						<% Response.Write(rs.Fields(5)) %> 
						</label>
					</div>
					<div class="col-xs-12"><label class="card-description-lable">By : <a href="viewDeveloper.asp?dev=<%Response.Write(rs.Fields(6))%>"><% Response.Write(rs.Fields(7)) %></a></label></div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<form name="f_shortlist" action="action_addToShortlist.asp">
						<input type="hidden" name="prop" value="<% Response.Write(rs.Fields(0)) %>"/>
						<input type="hidden" name="action" value="add"/>
						<input type="hidden" name="rdrPath" value=" <%Response.Write(Request.ServerVariables("SCRIPT_NAME")) %>">
						<%if Session("access") = "cust" then%>
						<button class="btn btn-success btn-choose-basket"  submit>Add to Shortlist</button>
						<% end if %>
						<a class="btn btn-success pull-right" href="ViewProperty.asp?prop=<% Response.Write(rs.Fields(0)) %>">View</a>
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
%>


			</div>
		</div>
	</div>
</div>
<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}

</script>
<style>
.mySlides {display:none}
.w3-left, .w3-right, .w3-badge {cursor:pointer}
.w3-badge {height:13px;width:13px;padding:0}
.w3-container{width: 100%;
    position: absolute;
    z-index: 9999;
    top: 120px;}
.w3-left{
	width:100px;
	position: absolute;
}
.w3-right{
	width:100px;
	right:0;
	position: absolute;
}
</style>
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
