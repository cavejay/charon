function testExposeFunction(){
    console.log("Charon.numApps = " + Charon.numApps);
    if(Charon.numApps == 0){
        return;
    }
    if(window.wm.mode === 'exposeHack'){
        window.wm.setModeFunction('default');
    } else {
        window.wm.setModeFunction('exposeHack');
    }

}
if (document.addEventListener) {
    document.addEventListener('contextmenu', function(e) {
        alert("You've tried to open context menu"); //here you draw your own menu
        e.preventDefault();
    }, false);
} else {
    document.attachEvent('oncontextmenu', function() {
        alert("You've tried to open context menu");
        window.event.returnValue = false;
    });
}