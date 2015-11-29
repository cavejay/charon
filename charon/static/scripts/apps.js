Charon = (typeof Charon !== "undefined") ? Charon : {};
// window.Charon = Charon;
Charon.apps = {};
Charon.numApps = 0;
console.log("set global");

function makeAppInstance(ref, opts) {

    Charon.numApps = Charon.numApps + 1;

    console.log("[APPLAUNCHER] attempting to launch "+ref);

    var id = ref+(Charon.apps[ref].uid);
    Charon.apps[ref].uid += 1;

    // Make the application tag and and append it to the app area
    var app = $('<application/>', {
      id: id,
      title: Charon.apps[ref].title,
      w: 640,
      h: 680,
      x: 50,
      y: 50
    }).appendTo('#apps');

    // Append the required app to the application tag
    var innerApp = $('<' + ref + '>', opts).appendTo(app);

    // Mount the application tag. The yield inside application tag will take
    // care of mounting the inner app (I think)
    riot.mount('#' + id);
}
function openSelectedFile(){
  //Charon.rightClickedObject
}
function downloadSelectedFile(){
  //Charon.rightClickedObject
}
function deleteSelectedFile(){
  //Charon.rightClickedObject
}
