<applauncher>
    <div class="taskbar">
        <button id="app-list-button" onclick={ this.click }>
            <i class="zmdi zmdi-favorite zmdi-hc-3x"></i>
        </button>
        <div id="titlebar">
            <h2> C H A R O N </h2>
        </div>
    </div>
    <div class='applist'>
        <ul>
            <li each={ apps }>
                <button class="app" onclick={ launch }>
                    { name }
                </button>
            </li>
        </ul>
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
    #app-list-button {
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
        left: 0px;
    }
    .app {
        border-color: black;
        border-style: dotted;
        background-color: lightgrey;
    }
    .app:hover {
        cursor: pointer;
    }

    /** other tag specific styles **/
    </style>

    <script>
    /* a list of all our apps */
    this.apps = [
        {name: "File Browser", launch: function(){console.log("you just launched the file browser")}},
        {name: "Terminal", launch: function(){console.log("you just launched the the terminal")}},
        {name: "Vim.js", launch: function(){console.log("Not implemented yet")}},
    ]
    this.colour_win = "mdc-text-grey"

    click() {

        console.log('lol')
    }
    </script>


</applauncher>
