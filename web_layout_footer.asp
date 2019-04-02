<div id="backdrop">
</div>
<footer style="background-color:#ccc; content:'Sagar'; height:200px; width:100%;">
<div class="container">
	Developed by 
	<ul>
	<li>Sagar Patil</li>
	<li>Manish Khande</li>
	<li>Swapnil Pawar</li>
	</ul>
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