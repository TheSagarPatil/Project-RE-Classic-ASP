<!-- #Include File = "web_layout_header.asp" -->
<br>
<br>
<%
action = request.querystring("action")
if action = "logout" then
	Session.Abandon
	Response.Redirect("login.asp?msg=logoutSuccesfull")
end if
%>
<br>
<head>
<link rel="stylesheet" href="app/css/stylesh.css" />
</head>

	<div class="container containerMain" id="Login2"   >
		<form id="login" name="login" action="action_LoginAndForwardToHome.asp" method="post" class="col-lg-offset-4 col-lg-4">
			<div class="row ">
				<div class="col-xs-12">
					<h1>Login</h1>
				</div>
			</div>
			<div class="row ">
				<div class="col-xs-12 col-md-4 col-lg-8">
					<label for="uname">Email<span style="color:red;">*</span></label><input type="text" name="txt_email" class="form-control" id="uname" required >
				</div>
			</div>
			<div class="row ">
				<div class="col-xs-12 col-md-4 col-lg-8">
					<label for="uname">Password :<span style="color:red;">*</span></label><input type="text" name="txt_email" class="form-control" id="uname" required >
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-5 col-lg-7">
					<div class="form-group">
						<label for="signInAs">Sign In As</label>
						<div class="input-group">	
						<select name="loginType" class="form-control" id="signInAs">
							<option value="cust" selected>Customer</option>
							<option value="dev">Developer (Representative)</option>
							<option value="agnt">Agent</option>
							<option value="corp">Corporate Employee</option>
						</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-6 col-md-4">
					<div class="form-group">
						<div class="input-group">	
						<button class="btn btn-primary" type="submit">SUBMIT</button>
						</div>
					</div>
				</div>
			
				
				<div class="col-xs-6 col-md-4 text-right">
					<!--<a href="ForgotPassword.aspx">Forgot Password</a><br>-->
					<a href="register.asp">Register</a>
				</div>
			</div>
		</form>
	</div>
</div>

<!-- #Include File = "web_layout_footer.asp" -->