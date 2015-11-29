
$( document ).ready(function() {
    console.log( "AEKG ready!" );
});
function myFunction() {
    console.log("Text was clicked.");
    document.getElementById("demo").style.color = "red";
    $.ajax({url: "login", success: function(result){
        //document.getElementById("demo").text = result;
        var element = document.getElementById('demo');
        element.innerHTML = element.innerHTML + " " + result;
        console.log( result );
    }});
}
//var wmHack;
var numWindowsOnScreen = 0;
function testExposeFunction(){
    if(numWindowsOnScreen == 0){
        return;
    }
    if(window.wm.mode === 'exposeHack'){
        window.wm.setModeFunction('default');
    } else {
        window.wm.setModeFunction('exposeHack');
    }

}