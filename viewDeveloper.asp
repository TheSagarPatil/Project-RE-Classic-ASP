<!-- #Include File = "web_layout_header.asp" -->
<!-- #Include File = "cfg_config.asp" -->
<%
devId = request.querystring("dev")
query = "SELECT tbl_developer.developerId, tbl_developer.developerCompanyName, tbl_developer.dev_addressLine1, tbl_developer.dev_locality, tbl_developer.dev_city, tbl_developer.dev_state, tbl_developer.dev_pincode, tbl_developer.dev_landmark FROM tbl_developer WHERE (((tbl_developer.developerId)="&devId&"));"
'Response.Write( query )
rs.open query, conn, 1

do until rs.EOF
%>
	<div class="container containerMain">
		<div class="col-xs-12 col-lg-10 col-lg-offset-1" style="padding:0px 24px 16px 24px; border-radius:2px; box-shadow: 0px 5px 10px 2px ;">
		<div class="row">
			<div class="col-xs-12"><h3 class="card-title-label"><% Response.Write(rs.fields(1)) %></h3> </div>
			<div class="col-xs-12 hidden"><label class="card-promotion-lable"><% Response.Write(rs.fields(0)) %></label>
			<label class="pull-right"><%Response.Write(rs.fields(0))%> Views</label>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-6 ImageHolderLarge hidden" style="height:250px; margin-bottom:16px;overflow:hidden; background-image: url('images/props/<% Response.Write(rs.fields(0)) %>.jpg');">
			</div>
			<div class="col-xs-12">
				
				<div class="row">
					<div class="col-xs-12">
						<span style="font-weight:bold;">Address : </span><br/>
						<label class="card-description-lable">
						<% Response.Write(rs.fields(1)) %>, <br/>
						<% Response.Write(rs.fields(2)) %>, <br/>
						<% Response.Write(rs.fields(3)) %>, <br/>
						<% Response.Write(rs.fields(4)) %>
						</label>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<label class="card-description-lable">
						<%if IsNull(rs.fields(7)) then
							Response.Write("Landmark : Not set")
						else
							Response.Write("Landmark : " & rs.fields(7))
						end if%>
						 
						<br/>
						Pincode : <%Response.Write(rs.fields(6))%>
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
			<button class="btn btn-success" >Edit</button>
			<a class="btn btn-success pull-right" propId="0" href="purchase.asp?propId=<%Response.Write(rs.fields(0))%>">Purchase</a>
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