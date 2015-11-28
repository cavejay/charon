<applauncher>
    <div class="taskbar">
        <button id="applistbutton" onclick={ this.click }>
            <i class="zmdi zmdi-favorite zmdi-hc-3x"></i>
        </button>
        <div id="titlebar">
            <h2> C H A R O N </h2>
        </div>
    </div>
    <div class='appMenu' if={ showingApps }>
            <li each={ appMenu }>
                <button class="app" onclick={ launch }>
                    { name }
                </button>
            </li>
    </div>
    <div class='openapps' if={ !openApps }>
        <application
            each={ openApps }
            title={ title }
            id={ id }
            width={ width }
            height={ height }
            x={300}
            y={300}>
        Flask Shop.
            <testappstuff></testappstuff>
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
        background-color: skyblue;
        box-shadow: 0 0 12px 1px rgba(0, 0, 0, 0.6);
    }
    #applistbutton {
        height: 50px;
        width: 50px;
        float: left;
        background-color: #365d98;
        margin-right: 10px;
        padding: 0 0;
    }
    #app-list-button:hover {
        background-color: #4C84D9;
        cursor: pointer;
    }
    #titlebar h2 {
        text-align: center;
        margin: auto;
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

    /** other tag specific styles **/
    </style>

    <script>
    this.apps = {
        filebrowser: {
            title: "File Browser",
            id: -1,
            width: -1,
            height: -1,

        }
    }
    /* a list of all our apps */
    this.appMenu = [
        {name: "File Browser", launch: function(){console.log("you just launched the file browser")}},
        {name: "Terminal", launch: function(){console.log("you just launched the the terminal")}},
        {name: "Vim.js", launch: function(){console.log("Not implemented yet")}},
        {name: "Text Editor", launch: function(){console.log("you just launched the text editor")}},
    ]
    this.showingApps = false;
    click() {
        this.showingApps = (this.showingApps) ? false : true;
        console.log('lol')
    }
    </script>


</applauncher>
