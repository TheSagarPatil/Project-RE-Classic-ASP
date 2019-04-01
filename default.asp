<!-- #Include File = "web_layout_header.asp" -->

<% Response.Write "{message:Hello, world!}" & Session("firstName")%>
		<div class="container containerMain" id="home">
			<div class="row ">
				<div class="col-xs-12">
					<h1>Trending Properties</h1>
				</div>
			</div>
			<div class="row flex-wrapper" style="overflow-x:auto;">
				<div class="card-container">
					<div class="flex-cards container">
						<div class="jumbotron pricing-card card">
							<div class="row">
								<div class="col-xs-12"><label class="card-title-label">Property 1</label> </div>
								<div class="col-xs-12"><label class="card-promotion-lable">Trending in XYZ Area</label></div>
							</div>
							<div class="row">
								<div class="imageHolder" style="">
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12"><label class="card-description-lable">Property Information Line 1</label></div>
								<div class="col-xs-12"><label class="card-description-lable">Property Information Line 2</label></div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<button class="btn btn-success " basketid="1">Add to Shortlist</button>
									<button class="btn btn-success pull-right" basketid="1">View</button>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		<div class="container" id="registerFrm">
			<div class="row ">
				<div class="col-xs-12 col-sm-6 col-md-7 col-lg-7">
					<h1>Explore Properties</h1>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-5 col-lg-5">
					<div class="input-group" style="margin-top:20px">	
					<input type="text" class="form-control searchBox" id="search" Placeholder="Search by Property Name, Developer Name, Locality"/>
					</div>
				</div>
			</div>
			<div class="row flex-wrapper" style="overflow-x:auto;">
				<div class="card-container2">
					<div class="flex-cards col-xs-12 col-sm-6 col-md-4 col-xs-12">
						<div class="jumbotron pricing-card card">
							<div class="row">
								<div class="col-xs-12"><label class="card-title-label">Property 1</label> </div>
								<div class="col-xs-12"><label class="card-promotion-lable">XYZ Area</label></div>
							</div>
							<div class="row">
								<div class="imageHolder" style="">
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12"><label class="card-description-lable">Property Information Line 1</label></div>
								<div class="col-xs-12"><label class="card-description-lable">Property Information Line 2</label></div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<button class="btn btn-success btn-choose-basket"  >SUBSCRIBE</button>
									<a href=""></a>
								</div>
							</div>
						</div>
					</div>
					
				</div>
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