<applauncher>
    <div class="taskbar">
        <button id="applistbutton" onclick={ this.click }>
            <i class="zmdi zmdi-favorite zmdi-hc-3x"></i>
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
    <div if={ !openApps }>
        <application
            each={ openApps }
            title={ title }
            id={ id }
            width={ width }
            height={ height }
            x={x}
            y={y}>
        </application>
    </div>

    <style>
    applauncher {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
    }
    .taskbar {
        position: absolute;
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
        background-color: #365d98;
        margin-right: 10px;
        padding: 0 0;
    }
    #applistbutton:hover {
        background-color: #4C84D9;
        cursor: pointer;
    }
    #titlebar h2 {
        text-align: center;
        margin: auto;
    }

    /** other tag specific styles **/
    </style>

    <script>
    this.apps = {
        filebrowser: {
            title: "File Browser",
        },
        terminal: {
            title: "Terminal",
        }
    }
    /* a list of all our apps */
    this.appMenu = [
        {name: "File Browser", ref: "filebrowser", launch: function(){console.log("you just launched the file browser")}},
        {name: "Terminal", ref: "terminal", launch: function(){console.log("you just launched the the terminal")}},
        {name: "Vim.js", ref: "vimjs", launch: function(){console.log("Not implemented yet")}},
        {name: "Text Editor", ref: "textedit", launch: function(){console.log("you just launched the text editor")}},
    ]

    // Show and hide the app launcher's menu
    this.showingApps = false;
    click() {
        this.showingApps = (this.showingApps) ? false : true;
    }

    start() {
        for (i = 0; i < this.appMenu.length; i++) {
            var tmp = {};
            tmp.title = this.appMenu[i].name;
            tmp.id = -1; tmp.width = -1; tmp.height = -1;
            tmp.x = -1; tmp.y = -1;
            this.apps[this.appMenu[i].ref] = tmp;
        }
        console.log(this.apps);
    };
    this.start();
    </script>


</applauncher>
