<head >
    <meta charset="utf-8" http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <title>Premier Homes</title>
	<link rel="stylesheet" href="app/css/lib/bootstrap.min.css" />
	<link rel="stylesheet" href="app/css/lib/jquery-ui.css"/>

    <link rel="stylesheet" href="app/css/main.css"/>
	<link rel="stylesheet" href="app/css/custom.css" />    
	
	<script src="app/js/lib/jquery.js"></script>
	<script src="app/js/lib/bootstrap.js"></script>
	<script src="app/js/lib/jquery-ui.js"></script>
</head>
<nav class="navbar navbar-fixed-top navbar-default" id="top-nav">
  <div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<div class="hidden">
					<span class="glyphicon glyphicon-arrow-left"></span>
			</div>
			<button type="button" class="navbar-toggle collapsed pull-right visible-lg visible-md visible-sm visible-xs"  data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="Default.asp">Premier Homes</a>
		</div>
	</div><!-- /.container-fluid -->
</nav>
<aside class="col-xs-10 col-sm-4 col-md-5 col-lg-3 offCanvasNavigation" id="offcanvas-nav">
	<div class="row"style="height:100%;">
		<div class="col-xs-12 offCanvasOptionsContainer" >
			<div class="row">
				<div class="col-xs-12" style="padding:12px;background-color:var(--default-primary-color); color:#fff;">
					<div class="pull-left"  style="background-image:url('emoticon.jpg') ;background-size:cover; background-position: center;width:44px;height:44px;border:1px solid #111;background-color:#fff;">
					
					</div>
					<div class="pull-left"style="padding: 8px;font-size: 20px;">
					
					<%
					'Session("UserName") = "A"
					If Session("firstName") = "" Then
						Response.Write("Please Login")
					Else 
						Response.Write("Hi " & Session("firstName"))
					End If
					%>
					</div>
				</div>
			</div>
			<ul class="row mainMenu" >
				<li class=""><div><a href="Default.asp">Explore</a></div></li>
			</ul>
			<%if Session("access") = "cust" then%>
			<ul class="row mainMenu" >
				<li class=""><div><a href="viewShortList.asp">View Shortlist</a></div></li>
			</ul>
			<% end if %>
			<%if Session("access") = "" then%>
			<ul class="row mainMenu">
				<li class=""><div><a href="Login.asp">Login</a></div></li>
				<li class=""><div><a href="Register.asp">Register</a></div></li>
			</ul>
			<%else%>
			<ul class="row mainMenu">
				<li class=""><div><a href="Login.asp?action=logout">Logout</a></div></li>
			</ul>
			<%
			end if
			%>
			<%if Session("access") = "dev" or Session("access") = "agnt" or Session("access") = "cust" or Session("access") = "corp"then%>
			<!--<ul class="row mainMenu">
				<li class=""><div class="ddcaption" style="width:100%;">Account</div>
					<ul class="dropdown">
						<li class=""><a href="updateProfile.asp?personId=XX">Update Profile</a></li>
					</ul>
				</li>
			</ul>-->
			<%end if %>
			
			<% if Session("access") = "corp" then%>
			<ul class="row mainMenu">
				<li class=""><div class="ddcaption" style="width:100%;">Management</div>
					<ul class="dropdown">
						<li class=""><a href="viewDevelopers.asp">Manage Developers</a></li>
						<li class=""><a href="viewProperties.asp">Manage Properties</a></li>
						
						<li class=""><a href="viewCustomers.asp">Manage Customers</a></li>
						<li class=""><a href="viewInquiries.asp">Manage Inquiries</a></li>
					</ul>
				</li>
			</ul>
			<% end if %>
			
			<% if Session("access") = "agnt" or Session("access") = "corp" then%>
			<ul class="row mainMenu">
				<li class=""><div class="ddcaption" style="width:100%;">Inquiries</div>
					<ul class="dropdown">
						<li class=""><a href="viewInquiries.asp">View Inquiries</a></li>
					</ul>
				</li>
			</ul>
			<% end if %>
		</div>	
	</div>
</aside>
