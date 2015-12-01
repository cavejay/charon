Charon = (typeof Charon !== "undefined") ? Charon : {};
// window.Charon = Charon;
Charon.apps = {};
Charon.numApps = 0;
Charon.appStartingIndent = 50;
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
      h: (ref === "imageviewer") ? 0 : 480,
      x: Charon.appStartingIndent + 20*Charon.numApps,
      y: Charon.appStartingIndent + 20*Charon.numApps
    }).appendTo('#apps');

    // Append the required app to the application tag
    var innerApp = $('<' + ref + '>', opts).appendTo(app);

    // Mount the application tag. The yield inside application tag will take
    // care of mounting the inner app (I think)
    riot.mount('#' + id);
}
function openSelectedFile(){
  //zmdi zmdi-file
  //zmdi zmdi-folder-outline
  console.log('openSelectedFile - ');
  var path = getFilePathOfRightClicked();
  console.log('path = ' + path);

  makeAppInstance("texteditor", { filepath: path } );

  $(".custom-menu").hide(100);
}
function downloadSelectedFile(){
  console.log('downloadSelectedFile - ');
  var path = getFilePathOfRightClicked();
  console.log('path = ' + path);

  var url = "fs/get";
  url += path;

  console.log("downloading: " + url);

  window.open(url,'_blank');
/*
  $.ajax({url: url,
    type: 'GET',
    success: function(result){
    console.log("Get complete! - " + result);
  }});
*/
  $(".custom-menu").hide(100);
}
function deleteSelectedFile(){
  console.log('deleteSelectedFile - ');
  var path = getFilePathOfRightClicked();
  console.log('path = ' + path);

  var url = "fs/del";
  url += path;

  console.log("deleting: " + url);

  $.ajax({url: url,
    type: 'POST', /* this should be a DELETE :'( */
    success: function(result){
    console.log("Delete complete! - " + result);
  }});

  $(".custom-menu").hide(100);
}
function getFilePathOfRightClicked(){
  var path = Charon.pwdmegahack + "/" + Charon.rightClickedObject.parent().children('td').slice(1, 2).text();
  if(Charon.pwdmegahack == '/'){
    path = Charon.rightClickedObject.parent().children('td').slice(1, 2).text();
  }
  return path;
}
