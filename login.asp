<!-- #Include File = "web_layout_header.asp" -->
<%
action = request.querystring("action")
if action = "logout" then
	Session.Abandon
end if
%>

	<div class="container containerMain" id="Login2"   >
		<form id="login" name="login" action="action_LoginAndForwardToHome.asp" method="post">
			<div class="row ">
				<div class="col-xs-12">
					<h1>Login</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-8 col-lg-3">
					<div class="form-group">
						<label for="uname">Email</label>
						<div class="input-group">	
						<input type="text" name="txt_email" class="form-control" id="uname">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-8 col-lg-3">
					<div class="form-group">
						<label for="pwd">Password</label>
						<div class="input-group">	
						<input type="password" name="txt_password" class="form-control" id="pwd">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-8 col-lg-3">
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
					<a href="ForgotPassword.aspx">Forgot Password</a><br>
					<a href="Register.aspx">Register</a>
				</div>
			</div>
		</form>
	</div>
</div>

<!-- #Include File = "web_layout_footer.asp" -->