<applauncher>
    <div id="taskbar">
        <button id="app-list-button" onclick={ this.click }>
            <i class="zmdi zmdi-favorite zmdi-hc-3x"></i>
        </button>
        <div id="titlebar">
            <h2> C H A R O N </h2>
        </div>
    </div>
    <div>
        <ul>
            <li each={ items }>
                <label class={ completed: done }>
                    <input type="checkbox" checked={ done } onclick={ parent.toggle }> { instan }
                </label>
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
    #taskbar {
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
    /** other tag specific styles **/
    </style>

    <script>
    var colour_win = "mdc-text-grey"

    click() {
        console.log('lol')
    }
    </script>


</applauncher>
