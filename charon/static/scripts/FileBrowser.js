function getDirectory(path) {
    console.log("Something was clicked: " + path);
    $.ajax({url: "list/" + path, success: function(result){
        updateFileBrowser(result);
    }});
}
function updateFileBrowser(resultsData){
    console.log("updateFileBrowser function.");
    $( "#filebrowsertable" ).empty();
    for(var i = 0; i < resultsData.data.length; i++){
        var aElement = "<a onclick=\"getDirectory(\'" + resultsData.data[i] + "\')>" + resultsData.data[i] + "</a>";
        var appendment = "<tr><td>" + aElement + "<td></tr>";
        console.log(appendment);
        $( "#filebrowsertable" ).append(appendment);
        console.log("[" + i + "] = " + resultsData.data[i]);
    }
    //.append("<b>Appended text</b>");
}