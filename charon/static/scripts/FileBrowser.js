function getDirectory(path) {
    console.log("Something was clicked: " + path);
    $.ajax({url: "fs/list/" + path, success: function(result){
        updateFileBrowser(path, result);
    }});
}
function downloadFile(path) {
    console.log("Want to download the file: " + path);
}
function updateFileBrowser(subPath, resultsData){
    console.log("updateFileBrowser function.");
    $( "#filebrowsertable" ).empty();

    $newRowHeaderStart = $("<tr>");
    $newRowHeaderStart.appendTo($("#filebrowsertable"));

    jQuery('<th/>', {
        text: "file"
    }).appendTo($newRowHeaderStart);

    jQuery('<th/>', {
        text: "last modified"
    }).appendTo($newRowHeaderStart);

    jQuery('<th/>', {
        text: "size"
    }).appendTo($newRowHeaderStart);

    jQuery('<th/>', {
        text: "download"
    }).appendTo($newRowHeaderStart);

    jQuery('<th/>', {
        text: "delete"
    }).appendTo($newRowHeaderStart);

    $newRowHeaderEnd = $("</tr>");
    $newRowHeaderEnd.appendTo($("#filebrowsertable"));

    for(var i = 0; i < resultsData.data.length; i++){
        var fileData = resultsData.data[i];
        var isFile = fileData.isFile;
        var lastModified = fileData.lastModified;
        var fileName = fileData.name;
        var size = fileData.size;

        $newRowStart = $("<tr>");
        $newRowStart.appendTo($("#filebrowsertable"));

        $newEntryStart = $("<td>");
        $newEntryStart.appendTo($newRowStart);

//        $newAStart = $("<a>");
//        $newAStart.appendTo($newEntryStart);
//
//        $newAStart.append(resultsData.data[i]);

        var newPath = subPath + "/" + fileName;
        var newIdFile = "fileselect-" + i;
        var newIdDowload = "filedownload-" + i;
        var newIdDelete = "filedelete-" + i;

        if(isFile == false){
            jQuery('<a/>', {
                id: newIdFile,
                text: fileName,
                newPath: newPath
            }).appendTo($newEntryStart);

            bindClick(newIdFile, newPath);
        } else {
            jQuery('<div/>', {
                id: newIdFile,
                text: fileName,
                newPath: newPath
            }).appendTo($newEntryStart);
        }

        $newEntryEnd = $("</td>");
        $newEntryEnd.appendTo($("#filebrowsertable"));

        jQuery('<td/>', {
            text: lastModified
        }).appendTo($newRowStart);

        jQuery('<td/>', {
            text: size
        }).appendTo($newRowStart);



        if(isFile == true){
            bindDownloadButton($newRowStart, newPath, newIdDowload);
        } else {
            jQuery('<td/>', {
                text: "-"
            }).appendTo($newRowStart);
        }

        $newEntryStart3 = $("<td>");
        $newEntryStart3.appendTo($newRowStart);

        jQuery('<input/>', {
            type:"image",
            src:"static/img/delete.png",
            text: "D"
        }).appendTo($newEntryStart3);

        $newEntryEnd3 = $("</td>");
        $newEntryEnd3.appendTo($newRowStart);

        //<input type="image" src="submit.gif" alt="Submit">

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
}
function bindClick(uniqueId, newPath){
    $( "#"+newId ).bind('click', function(){
        console.log($( "#"+newId ).attr("newPath"))
        getDirectory(String(newPath));
    });
}
function bindDownloadButton(row, newPath, newIdDowload){
    $newEntryStart = $("<td>");
    $newEntryStart.appendTo(row);

    jQuery('<input/>', {
        id: newIdDowload
        type: "image",
        src: "static/img/download.png",
        text: "D"
    }).appendTo(tdElement);

    $newEntryEnd = $("</td>");
    $newEntryEnd.appendTo(row);

    $( "#"+newIdDowload ).bind('click', function(){
        console.log($( "#"+newIdDowload ).attr("newPath"))
        downloadFile(newIdDowload);
    });
}