function getDirectory(path) {
    console.log("Something was clicked: " + path);
    $.ajax({url: "list/" + path, success: function(result){
        updateFileBrowser(path, result);
    }});
}
function updateFileBrowser(subPath, resultsData){
    console.log("updateFileBrowser function.");
    $( "#filebrowsertable" ).empty();
    for(var i = 0; i < resultsData.data.length; i++){
        var aElement = "<a onclick=\"getDirectory(\'" + resultsData.data[i] + "\')>" + resultsData.data[i] + "</a>";
        var appendment = "<tr><td>" + aElement + "<td></tr>";
        $input = $(appendment);

        $newRowStart = $("<tr>");
        $newRowStart.appendTo($("#filebrowsertable"));

        $newEntryStart = $("<td>");
        $newEntryStart.appendTo($newRowStart);

//        $newAStart = $("<a>");
//        $newAStart.appendTo($newEntryStart);
//
//        $newAStart.append(resultsData.data[i]);

        var newPath = subPath + "/" + resultsData.data[i];
        var newId = "fileselect-" + i;

        jQuery('<a/>', {
            id: newId,
            text: resultsData.data[i],
            newPath: newPath
        }).appendTo($newEntryStart);

        $( "#"+newId ).bind('click', function(){
            console.log($( "#"+newId ).attr("newPath"))
            getDirectory(String(newPath) + i);
        });

//        console.log(newPath);
//
//        $newAStart.bind('click', function(){
//            getDirectory(newPath);
//        });

        $newAEnd = $("</a>");
        $newAEnd.appendTo($("#filebrowsertable"));

        $newEntryEnd = $("</td>");
        $newEntryEnd.appendTo($("#filebrowsertable"));

        $newRowEnd = $("</tr>");
        $newRowEnd.appendTo($("#filebrowsertable"));
        //$input.appendTo($("#filebrowsertable"));
        /*
        console.log(appendment);
        //
        //$( "#filebrowsertable" ).append(appendment);
        var element = document.getElementById('filebrowsertable');
        element.innerHTML = appendment;
        //$( "#filebrowsertable" ).innerHTML = appendment;
        */
        console.log("[" + i + "] = " + resultsData.data[i]);
    }
    //.append("<b>Appended text</b>");
}