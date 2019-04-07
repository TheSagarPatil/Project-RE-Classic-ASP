<!-- #Include File = "web_layout_header.asp" -->
<!-- #Include File = "cfg_config.asp" -->
<%
custId = request.querystring("cust")
query = "SELECT tbl_person.ID, tbl_person.firstName, tbl_person.lastName, tbl_person.email, tbl_person.pan, tbl_person.phoneNumber, tbl_person.city, tbl_customer.customerId, tbl_person.apartment, tbl_person.flatNumber, tbl_person.propertyNumber, tbl_person.town_village, tbl_person.city, tbl_person.state,  tbl_person.landmark, tbl_person.pincode FROM tbl_customer inner join   tbl_person  on tbl_customer.customerId = tbl_person.Id WHERE (((tbl_customer.customerId)="&custId&"));"
'Response.Write( query )
rs.open query, conn, 1

do until rs.EOF
%>
	<div class="container containerMain">
		<div class="col-xs-12 col-lg-10 col-lg-offset-1" style="padding:0px 24px 16px 24px; border-radius:2px; box-shadow: 0px 5px 10px 2px ;">
		<div class="row">
			<div class="col-xs-12"><h3 class="card-title-label"> <% Response.Write(rs.fields(1)) %> <% Response.Write(rs.fields(2)) %></h3> </div>
			<div class="col-xs-12 "><label class="card-promotion-lable">Contact Details : <% Response.Write(rs.fields(3)) %> , <% Response.Write(rs.fields(5)) %></label>
			<label class="pull-right"></label>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-6 ImageHolderLarge hidden" style="height:250px; margin-bottom:16px;overflow:hidden; background-image: url('images/custs/<% Response.Write(rs.fields(0)) %>.jpg');">
			</div>
			<div class="col-xs-12">				
				<div class="row">
					<div class="col-xs-12">
					

						<label class="card-description-lable">
						<% Response.Write(rs.fields(4)) %>, <br/>
						<% Response.Write(rs.fields(5)) %>, <br/>
						</label><br/>
						<span style="font-weight:bold;">Address : </span><br/>
						<label class="card-description-lable">
						Apartment Name : <% Response.Write(rs.fields(8)) %><br/>
						Flat/ House No : <% Response.Write(rs.fields(9)) %><br/>
						Property Number : <% Response.Write(rs.fields(10)) %><br/>
						<%if IsNull(rs.fields(14)) then
							Response.Write("Landmark : Not set")
						else
							Response.Write("Landmark : " & rs.fields(14))
						end if%>
						 
						<br/>
						Locality : <% Response.Write(rs.fields(11)) %><br/>
						City : <%Response.Write(rs.fields(6))%>,<br/> <br/>
						State : <% Response.Write(rs.fields(13)) %><br/>
						Pincode : <% Response.Write(rs.fields(15)) %><br/>
						</label>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			
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