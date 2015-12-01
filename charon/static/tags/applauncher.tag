<applauncher>
    <div class="taskbar">
        <button id="applistbutton" onclick={ this.click }>
            <img src="static/img/icons/favicon-32x32.png" />
        </button>
        <button id="expose-button" onclick='testExposeFunction()'>
            <i class="zmdi zmdi-apps zmdi-hc-3x"></i>
        </button>
        <div id="titlebar">
            <h2> C H A R O N </h2>
        </div>
    </div>
    <div class='applist' if={ showingApps }>
        <li each={ appMenu }>
            <button class="app" onclick={ launch }>
                <i class="zmdi zmdi-{ icon }" />
                { name }
            </button>
        </li>
    </div>
    <ul class='custom-menu'>
      <li data-action="open" onclick="openSelectedFile()">Open File in Text Editor</li>
      <li data-action="download" onclick="downloadSelectedFile()">Download File</li>
      <li data-action="delete" onclick="deleteSelectedFile()">Delete File</li>
    </ul>

    <style scoped>
    .taskbar {
        position: absolute;
        top: 0;
        left: 0;
        height: 50px;
        width: 100%;
        color: white;
        background-color: rgba(0,0,0,0.6);
        box-shadow: 0 0 12px 1px rgba(0, 0, 0, 0.6);
    }
    .applist {
        background: rgba(255, 255, 255, 1);
        position: absolute;
        top: 50px;
        width: 150px;
        left: 0px;
        list-style: none;
    }
    .app {
        background: none;
        border: none;
        padding: 10px;
        /*border-left: 1px solid rgba(128, 128, 128, 0.75);
        border-right: 1px solid rgba(128, 128, 128, 0.75);
        border-bottom: 1px solid rgba(128, 128, 128, 0.75);*/
        color: black;
        text-align: left;
        font-family: 'Open Sans', cursive;
        width: 100%;

    }
    .app:hover {
        background: rgba(192, 192, 192, 0.75)
    }
    #applistbutton {
        height: 50px;
        width: 50px;
        float: left;
        background-color: #BF562C;
        outline: none;
        border: none;
        border-radius: 5px;
        margin-right: 5px;
        padding: 5px;
    }
    #applistbutton img {
        width: 100%;
        height: 100%;
    }
    #applistbutton:hover {
        background-color: #e8ad96;
        cursor: pointer;
    }
    #expose-button {
        height: 50px;
        width: 50px;
        float: left;
        border: none;
        margin-right: 10px;
        padding: 0 0;
        background-color: #BF562C;
        border-radius: 5px;
        outline: none;
    }
    #expose-button:hover {
        background-color: #e8ad96;
        cursor: pointer;
    }
    #titlebar h2 {
        text-align: center;
        line-height: 50px;
        margin: auto;
        font-family: 'Iceland', cursive;
    }

    /* CSS3 */

    /* The whole thing */
    .custom-menu {
        display: none;
        z-index: 100000;
        position: absolute;
        overflow: hidden;
        border: 1px solid #CCC;
        white-space: nowrap;
        font-family: sans-serif;
        background: #FFF;
        color: #333;
        border-radius: 5px;
        padding: 0;
    }

    /* Each of the items in the list */
    .custom-menu li {
        padding: 8px 12px;
        cursor: pointer;
        list-style-type: none;
    }

    .custom-menu li:hover {
        background-color: #DEF;
    }
    </style>

    <script>
    Charon.apps = {}; // Dict of all apps possible

    /* a list of all our apps */
    this.appMenu = [
        {name: "File Browser", icon: 'folder',  ref: "filebrowser", launch: function(){makeAppInstance("filebrowser"); this.click()}},
        {name: "Terminal", icon: 'code', ref: "terminal", launch: function(){makeAppInstance("terminal"); this.click()}},
        {name: "Text Editor", icon: 'file-text', ref: "texteditor", launch: function(){makeAppInstance("texteditor"); this.click()}},
        {name: "Image Viewer", icon: 'flower', ref: "imageviewer", launch: function(){makeAppInstance("imageviewer"); this.click()}},
        {name: "Reveal", icon: 'collection-image', ref: "reveal", launch: function(){makeAppInstance("reveal"); this.click()}},
        {name: "Video Player", icon: 'collection-image', ref: "videoplayer", launch: function(){makeAppInstance("videoplayer"); this.click()}},
    ];


    // Show and hide the app launcher's menu
    this.showingApps = false;
    click() {
        this.showingApps = (this.showingApps) ? false : true;
    }

    // Make the templates for each of the apps in the appMenu
    setup() {

        for (i = 0; i < this.appMenu.length; i++) {
            var tmp = {};

            // set the default values
            tmp.title = this.appMenu[i].name;
            tmp.tagName = this.appMenu[i].ref;
            tmp.uid = 0; tmp.width = -1; tmp.height = -1;
            tmp.x = -1; tmp.y = -1;

            // save it for later
            Charon.apps[this.appMenu[i].ref] = tmp;
        }
    };
    this.setup(); // run the setup script


// JAVASCRIPT (jQuery)

// Trigger action when the contexmenu is about to be shown
$(document).bind("contextmenu", function (event) {

    // Avoid the real one
    event.preventDefault();

    // Show contextmenu
    $(".custom-menu").finish().toggle(100).

    // In the right position (the mouse)
    css({
        top: event.pageY + "px",
        left: event.pageX + "px"
    });

    console.log("CONTEXT_MENU_CLICK");
});


    // If the document is clicked somewhere
    $(document).bind("mousedown", function (e) {
        // console.log("document mousedown");
        // If the clicked element is not the menu
        // console.log('e.target.class = ' + $(e.target).attr('class'));
        // console.log('e.target.charonClk = ' + $(e.target).attr('charonClk'));
        var shouldHideCustomMenu = true;
        //charonClk
        // console.log('$(e.target).parents(".file-column").length = ' + $(e.target).parents(".file-column").length);
        if($(e.target).attr('charonClk') == 'true'){
            // console.log('Something that you CAN context click on!' + $(e.target).attr('class'))
            Charon.rightClickedObject = $(e.target);
            if(e.which == 3){
              // console.log('was a right-click');
              shouldHideCustomMenu = false;
              $(".custom-menu").toggle(100).

              // In the right position (the mouse)
              css({
                  top: e.pageY + "px",
                  left: e.pageX + "px"
              });
            }
        } else if(typeof $(e.target).attr('data-action') !== 'undefined'){
          shouldHideCustomMenu = false;
        }

//data-action

        if(shouldHideCustomMenu == true){
          console.log('Hide the custom menu.');
          $(".custom-menu").hide(100);
        }
        /*
        if (!$(e.target).parents(".file-column").length > 0) {
            console.log(".file-column click 0-0-0");
            // Hide it
            //$(".custom-menu").show(100);
            $(".custom-menu").toggle(100).

            // In the right position (the mouse)
            css({
                top: e.pageY + "px",
                left: e.pageX + "px"
            });
        } else if (!$(e.target).parents(".custom-menu").length > 0) {
            console.log(".custom-menu click 0-0-0");
            // Hide it
            $(".custom-menu").hide(100);
        }
        */
    });
    </script>


</applauncher>
