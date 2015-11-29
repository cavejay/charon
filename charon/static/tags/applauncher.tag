<applauncher>
    <div class="taskbar">
        <button id="applistbutton" onclick={ this.click }>
            <i class="zmdi zmdi-apps zmdi-hc-3x"></i>
        </button>
        <div id="titlebar">
            <h2> C H A R O N </h2>
        </div>
        <button id="expose-button" taglol="testZ" onclick='testExposeFunction()'>
            <i class="zmdi zmdi-apps zmdi-hc-3x"></i>
        </button>
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
        line-height: 50px;
        margin: auto;
        font-family: 'Iceland', cursive;
    }
    </style>

    <script>
    this.apps = {}; // Dict of all apps possible
    this.openApps = []; // list of all active apps.

    // Make a new instance of an app
    makeAppInstance(ref) {
        console.log("[APPLAUNCHER] attempting to launch "+ref);

        /*
        title={ title }
        id={ id }
        width={ width }
        height={ height }
        x={x}
        y={y}>
        */

        console.log(this.apps);
        var id = ref+(this.apps[ref].uid);

        this.apps[ref].uid += 1;

        // Make the application tag and and append it to the app area
        var app = $('<application/>', {
          id: id,
          title: this.apps[ref].title,
          w: 640,
          h: 680,
          x: 50,
          y: 50
        }).appendTo('#apps');

        // Append the required app to the application tag
        $('<' + ref + '>').appendTo(app);

        // Mount the application tag. The yield inside application tag will take
        // care of mounting the inner app (I think)
        riot.mount('#' + id);

        this.click(); // hide the menu again
    }

    /* a list of all our apps */
    this.appMenu = [
        {name: "File Browser", ref: "filebrowser", launch: function(){this.makeAppInstance("filebrowser")}},
        {name: "Terminal", ref: "terminal", launch: function(){this.makeAppInstance("terminal")}},
        {name: "Text Editor", ref: "texteditor", launch: function(){this.makeAppInstance("texteditor")}},
        {name: "Vim.js", ref: "vimjs", launch: function(){console.log("Not implemented yet")}},
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
            this.apps[this.appMenu[i].ref] = tmp;
        }
    };
    this.setup(); // run the setup script
    </script>


</applauncher>
