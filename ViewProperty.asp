<!-- #Include File = "web_layout_header.asp" -->
<!-- #Include File = "cfg_config.asp" -->
<%
propId = request.querystring("prop")

query = "SELECT tbl_property.ID, tbl_property.developerId, tbl_property.propertyName, tbl_developer.developerCompanyName, tbl_property.propertyType, tbl_property.propertyPlotNumber, tbl_property.propertyLocality, tbl_property.propertyCity, tbl_property.propertyState, tbl_property.propertyPincode, tbl_property.views FROM tbl_developer INNER JOIN tbl_property ON tbl_developer.developerId = tbl_property.developerId WHERE (ID = "&propId&")"

'Response.Write( query )
rs.open query, conn, 1

do until rs.EOF
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
			<div class="col-xs-6 ImageHolderLarge" style="height:250px; margin-bottom:16px;overflow:hidden; background-image: url('images/props/<% Response.Write(rs.fields(0)) %>.jpg');background-size:cover;">
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
			</div>
		</div>
		<div class="row">
			
		</div>
		<div class="row">
			<div class="col-xs-12">
			<%
			if Session("customerId") then
			%>
			<button class="btn btn-success" >Add to Shortlist</button>
			<a class="btn btn-success pull-right" prop="0" href="purchaseProperty.asp?prop=<%Response.Write(rs.fields(0))%>">Purchase</a>
			<%
			end if
			%>
			
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

<!-- #Include File = "web_layout_footer.asp" -->