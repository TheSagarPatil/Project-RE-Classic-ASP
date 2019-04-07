<div id="backdrop">
</div>
<footer style="background-color:#ccc; content:'Sagar'; height:200px; width:100%;" id="Footer" >
<div class="container">
	<div class="container">
		<div class="row ">
			<div class="col-xs-6 col-sm-3 col-md-3 paddingTop30">
				<h4 class="footerHeaders col-xs-12">About Us</h4>
				<div class="col-xs-12">
					Contact Us
				</div>
				<div class="col-xs-12">
					FAQ
				</div>
			</div>
			<div class="col-xs-6 col-sm-3 col-md-2 paddingTop30">
				<h4 class="footerHeaders col-xs-12">Join Us</h4>
				<div class="col-xs-12">Careers</div>
				<div class="col-xs-12">Agents</div>
				<div class="col-xs-12">Partners</a></div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4 paddingTop30">
				<h4 class="footerHeaders col-xs-12">Help and Support</h4>
				<div class="col-xs-5 text-right">Email Us &nbsp; &nbsp;: </div>
				<div class="col-xs-7 ">
					<a class="nounderline" href="mailto:contact@premierhomes.tk">Click Here</a>
				</div>
				<div class="col-xs-5 text-right">Contact &nbsp; &nbsp;: </div>
				<div class="col-xs-7">+91 8796 337776<br>+91 8308 403724</div>
				
			</div>
			<div class="col-xs-12 col-sm-12 col-md-3 paddingTop30">
				<h4 class="footerHeaders col-xs-12">Developed by </h4>
				<div class="col-xs-12 ">Sagar Patil</div>
				<div class="col-xs-12 ">Manish Khande</div>
				<div class="col-xs-12 ">Swapnil Pawar</div>
			</div>
		</div>
	</div>
</div>
</footer>
<script>
function showBackdrop (){$('#backdrop').show();}
function hideBackdrop(){$('#backdrop').hide();}
function showMainMenu (){
//console.log("main menu clicked");
$('#backdrop').show();
$('aside').css("display","block");
$('aside').attr("left","0%");
$('aside').css("left","0px");
}
function hideMainMenu (){
$('aside').css("left","-100%");
//console.log("hide main menu ");
}
$('.navbar-toggle').click(function (){
	showMainMenu();
	showBackdrop();
});
$('#backdrop').click(function backdropClick(){
	$('[data-popup-mandatory="false"],[data-popup-mandatory=false]').hide();
	hideMainMenu();
	hideBackdrop();
});
</script>
<style>
.paddingTop30{padding-top:30px}
</style>