$('.fileFolderContainer').on('click', function (e) {
    //console.log(console.log( $(this).find('.chkbx_icon [type="checkbox"]').attr('checked') !="checked")
    //debugger;
    if ($(this).find('.chkbx_icon [type="checkbox"]').attr('checked') != "checked") {
        $(this).find('.chkbx_icon [type="checkbox"]').attr('checked', true)
    } else {
        $(this).find('.chkbx_icon [type="checkbox"]').removeAttr('checked')
    }
})

function showBackdrop() { $('#backdrop').show(); }
function hideBackdrop() { $('#backdrop').hide(); }
function showMainMenu() {
    //console.log("main menu clicked");
    $('#backdrop').show();
    $('aside').css("display", "block");
    $('aside').attr("left", "0%");
    $('aside').css("left", "0px");
}
function hideMainMenu() {
    $('aside').css("left", "-100%");
    //console.log("hide main menu ");
}
$('.navbar-toggle').click(function (e) {
    showMainMenu();
    showBackdrop();
})
$('#backdrop').click(function (e) {
    //for modals and dialogues	
    //$('aside').attr("data-popup-mandatory","false")

    //common
    $('[data-popup-mandatory="false"],[data-popup-mandatory=false]').hide();
    hideMainMenu();
    hideBackdrop()
})

/**/
$('.offCanvasOptionsContainer ul li .ddcaption').on('click', function (e) {

    $(this).parent().find('ul').css('display') != 'none' ? $(this).parent().find('ul').css('display', 'none') : $(this).parent().find('ul').css('display', 'block');

})
$(function () {
    $("#datepicker").datepicker();
});