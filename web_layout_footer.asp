<div id="backdrop"style=""></div>
<footer>
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