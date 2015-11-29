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
    </style>

    <script>
    Charon.apps = {}; // Dict of all apps possible

    /* a list of all our apps */
    this.appMenu = [
        {name: "File Browser", icon: 'folder',  ref: "filebrowser", launch: function(){makeAppInstance("filebrowser"); this.click()}},
        {name: "Terminal", icon: 'square-right', ref: "terminal", launch: function(){makeAppInstance("terminal"); this.click()}},
        {name: "Text Editor", icon: 'file-text', ref: "texteditor", launch: function(){makeAppInstance("texteditor"); this.click()}},
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



    </script>


</applauncher>
