<!-- #Include File = "web_layout_header.asp" -->
<!--#include File="cfg_config.asp" -->

<br>
<br>
<html>
<head>
<link rel="stylesheet" href="app/css/stylesh.css" />
 <script>
function validateForm() {
    var x = document.login.email.value;
	var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        alert("Not a valid e-mail address");
        return false;
    }
}
	function isNumber(evt) 
{
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode < 48 || charCode > 57)
	
	{
		alert("only 0 to 9 numbers are allow ! ");
        return false;
    }
    return true;
}
function checkpass()
{
	if(login.password.value="")
	{
	alert("Enter The Password");
	login.password.focus();
	return false;
	}
	if(login.cpassword.value="")
	{
	alert("Enter The Confirm Password");
	return false;
	}
	if(login.cpassword.value != login.password.value)
	{
	alert("Password MisMatch !");
	return false;
	}
return true;
}
    </script>
</head>
<body>
<div class="container containerMain" id="Login2"   >
<br>
		<form id="register" name="login" action="registerCustomer.asp" method="post" class="col-lg-offset-3 col-lg-6" onsubmit="return validateForm();" ">
			<div class="row ">
				<div class="col-xs-12">
					<h1 align="center">Register Form</h1>
				</div>
			</div>
			<div class="row ">
				<div class="col-xs-12 col-md-6 col-lg-6">
					<label for="uname">First Name<span style="color:red;">*</span></label><input type="text" name="fname" class="form-control" id="uname" required >
				</div>
				<div class="col-xs-12 col-md-6 col-lg-6">
				<label for="uname">Last Name :<span style="color:red;">*</span></label><input type="text" name="lname" class="form-control" id="uname" required >
				</div>
			</div>
			<div class="row ">
				<div class="col-xs-12 col-md-6 col-lg-6">
					<label for="uname">Phone Number:<span style="color:red;">*</span></label><input type="text" onkeypress="return isNumber(event);" name="phnumber" class="form-control" id="uname" maxlength="10" required >
				</div>
				<div class="col-xs-12 col-md-6 col-lg-6">
				<label for="uname">Email :<span style="color:red;">*</span></label><input type="text" name="email" class="form-control" id="uname" required >	
				</div>
			</div>
			<div class="row ">
				<div>
					<div class="col-xs-12 col-md-6 col-lg-6">
					<label for="uname">Pan Number:<span style="color:red;">*</span></label><input type="text" name="pannumber" class="form-control" id="uname" required >	
				</div>
				<div class="col-xs-12 col-md-6 col-lg-6">
					<label for="uname">Address </label><textarea name="address" class="form-control" id="uname" maxlength="25" name="address" required ></textarea>				
				</div>
				</div>
			</div>
			<div class="row ">
			<br>
				<div class="col-xs-12 col-md-6 col-lg-6">
					<label for="uname">Password :<span style="color:red;">*</span></label><input type="Password" name="password" class="form-control" id="uname">				
				</div>
				<div class="col-xs-12 col-md-6 col-lg-6">
					<label for="uname">Confirm Password :<span style="color:red;">*</span></label><input type="Password" name="cpassword" class="form-control" id="uname"  required >				
				</div>
			</div>
			<div class="row ">
				<div class="col-xs-12 col-md-6 col-lg-6">
					<div class="form-group">
						<label for="gender">Gender<span style="color:red;">*</span></label>
							<div class="input-group">	
							<select  class="form-control" name="gender">							
								<option value="Male" >Male</option>
								<option value="FeMale" >Female</option>
								<option value="Other" >Other</option>
							</select>
							</div>
					</div> 
				</div>	
			</div>
 			<div class="row ">
				<div class="col-xs-12 col-md-6 col-lg-6">
					<label for="uname">City :<span style="color:red;">*</span></label><input type="text" name="selectcity" class="form-control" id="uname" required >
				</div>
				<div class="col-xs-12 col-md-6 col-lg-6">
					<div class="form-group">
						<label for="signInAs">State<span style="color:red;">*</span></label>
							<div class="input-group">	
							<select name="select_State" class="form-control" id="signInAs">
							<option value="cust" selected >Select State</option>
							<option value="Maharashtra" >Maharashtra</option>
							<option value="Madhya_Pradesh">Madhya Pradesh</option>
							<option value="Rajasthan">Rajasthan</option>
							<option value="Uttar_Pradesh">Uttar Pradesh</option>
							<option value="Jammu_and_Kashmir">Jammu and Kashmir</option>
							<option value="Gujarat">Gujarat</option>
							<option value="Andhra_Pradesh">Andhra Pradesh</option>
							<option value="Chhattisgarh">Chhattisgarh</option>
							<option value="Tamil_Nadu">Tamil Nadu </option>
							<option value="Telangana">Telangana</option>
							<option value="Bihar">Bihar</option>
							<option value="West_Bengal">West Bengal</option>
							<option value="Arunachal_Pradesh">Arunachal Pradesh</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row ">
				<div class="col-xs-12 col-md-6 col-lg-6">
					<label for="uname">Pin Code :<span style="color:red;">*</span></label><input type="text" onkeypress="return isNumber(event);" maxlength="6" name="pan_code" class="form-control" id="uname" required >
				</div>
				<div class="col-xs-12 col-md-6 col-lg-6">
				<label for="uname">Landmark :</label><input type="text" name="landmark" class="form-control" id="uname" required >	
				</div>
			</div>
			<br>
			<div class="row " align="right">
				<div class="col-xs-12 col-md-5 col-lg-7">	
						<button class="btn btn-primary" type="submit" onclick="checkpass();" >SUBMIT</button>
						<br>
						<br>
				</div>
			</div>
</div>
<br>
<br>
<br>	
</body>
</html>
<!-- #Include File = "web_layout_footer.asp" -->