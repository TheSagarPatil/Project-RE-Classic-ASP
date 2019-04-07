<!-- #Include File = "web_layout_header.asp" -->
<!-- #Include File = "cfg_config.asp" -->
<%
prop = request.querystring("prop")
cust = request.querystring("cust")
query = "SELECT tbl_inquiry.customerId, tbl_inquiry.propertyId, tbl_person_1.firstName,   tbl_person_1.lastName, tbl_person_1.phoneNumber, tbl_inquiry.agentId, tbl_person.firstName, tbl_person.lastName, tbl_inquiry.propertyId, tbl_property.propertyName, tbl_inquiry.dateOfInquiry, tbl_inquiry.status FROM tbl_property INNER JOIN (tbl_person INNER JOIN (tbl_person AS tbl_person_1 INNER JOIN tbl_inquiry ON tbl_person_1.ID = tbl_inquiry.customerId) ON tbl_person.ID = tbl_inquiry.agentId) ON tbl_property.ID = tbl_inquiry.propertyId WHERE (((tbl_inquiry.customerId) = "&cust&")) AND (((tbl_inquiry.propertyId) = "&prop&"));"
Response.Write( query )
rs.open query, conn, 1

do until rs.EOF
%>
	<div class="container containerMain">
		<div class="col-xs-12 col-lg-10 col-lg-offset-1" style="padding:0px 24px 16px 24px; border-radius:2px; box-shadow: 0px 5px 10px 2px ;">
		<div class="row">
			<div class="col-xs-12"><h3 class="card-title-label"><% Response.Write(rs.fields(11)) %> Inquiry</h3> </div>
			<div class="col-xs-12 hidden"><label class="card-promotion-lable"><% Response.Write(rs.fields(0)) %></label>
			<label class="pull-right"><%Response.Write(rs.fields(0))%> Views</label>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-6 ImageHolderLarge hidden" style="height:250px; margin-bottom:16px;overflow:hidden; background-image: url('images/props/<% Response.Write(rs.fields(0)) %>.jpg');">
			</div>
			<form action="action_updateInquiry.asp" method="get">
				<div class="col-xs-12">
					<div class="row">
						<div class="col-xs-12">
							<input type="hidden" value="<%Response.Write(rs.fields(1))%>" name="prop">
							<span style="font-weight:bold;">Property : </span><br/>
							<label class="card-description-lable">
							#<% Response.Write(rs.fields(8)) %>&nbsp;<% Response.Write(rs.fields(9)) %>
							</label>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<input type="hidden" value="<%Response.Write(rs.fields(0))%>" name="cust">
							<span style="font-weight:bold;">Customer : </span><br/>
							<label class="card-description-lable">
							#<% Response.Write(rs.fields(0)) %>&nbsp; <% Response.Write(rs.fields(2)) %>&nbsp;<% Response.Write(rs.fields(3)) %>
							</label>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<span style="font-weight:bold;">Agent : </span><br/>
							<label class="card-description-lable">
							#<% Response.Write(rs.fields(8)) %>&nbsp; <% Response.Write(rs.fields(6)) %>&nbsp;<% Response.Write(rs.fields(7)) %>
							</label>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<span style="font-weight:bold;">Date : </span><br/>
							<label class="card-description-lable">
							#<% Response.Write(rs.fields(10)) %>
							</label>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xs-3">
							<div class="input-group">
								<label>Current Status : <%Response.Write(rs.fields(11))%></label>
								<label>Update Inquiry Status</label>
								<select name="inqStatus">
									
										<option value="Completed" selected>Completed</option>
										<option value="Pending">Pending</option>
									
								</select>
							</div>
						</div>
					</div>
					<div class="row" style="margin-top:20px;">
						<div class="col-xs-12">
							<div class="input-group">
								<input type="submit" value="Submit" class="btn btn-success"/>
							</div>
						</div>
					</div>
				</div>
			</form>
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