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
        position: absolute;
        top: 50px;
        width: 120px;
        left: 0px;
        list-style: none;
    }
    .app {
        background-color: lightgrey;
        width: 100%;
    }
    .app:hover {
        cursor: pointer;
    }
    #applistbutton {
        height: 50px;
        width: 50px;
        float: left;
        background-color: #BF562C;
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
        background-color: #555555;
        margin-right: 10px;
        padding: 0 0;
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
        {name: "File Browser", ref: "filebrowser", launch: function(){makeAppInstance("filebrowser"); this.click()}},
        {name: "Terminal", ref: "terminal", launch: function(){makeAppInstance("terminal")}},
        {name: "Text Editor", ref: "texteditor", launch: function(){makeAppInstance("texteditor")}},
        {name: "Vim.js", ref: "vimjs", launch: function(){console.log("Not implemented yet")}}
    ]



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
