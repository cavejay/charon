<loadingscreen>
    <div id="loading-screen" unselectable="on">
        <section>
            <div class="content">
                <header>
                    <h1 id='title'>C H A R O N</h1>
                </header>
                <form if={ !loggedIn } style="font-family: 'Iceland', cursive;">
                    <span>
                    <input class="loginbox" type="text" name="username" required>
                    <span class="loginbox" style="margin-left: 20px;"><input type="password" name="password" required></span>
                </form>
                <p if={ loggedIn }><img src="static/img/loader.gif" /> Loading...</p>
            </div>
        </section>
    </div>

    <style scoped>
        #title {
            font-family: 'Iceland', cursive;
        }
        #loading-screen {
            background: linear-gradient(to bottom, #BF562C, transparent)
        }
        input {
            margin-left: 8px;
            margin-right: -20px;
            height: 25px;
            border: 0px;
            padding: 2px;
            background: rgba(0, 0, 0, 0.5);
            color: #FFFFFF;
            font-family: 'Iceland', cursive;
        }
    </style>

    <script>
        this.loggedIn = false;

        // Hide loader when loaded
        var loader = $("#loading-screen");

        send() {
            $.ajax({
                type: "POST",
                url: "/login",
                data: {'username': username, 'password': password},
                success: function(result) {
                    loader.addClass('hide');
                    loader.on(Ventus.browser.animationEventName(), function() {
                        loader.hide();
                    });
                },
                statusCode: {
                    404: function() {
                        alert( "page not found" );
                    },
                    401: function() {
                        console.log("U GOT WORNG U SCRUB");
                    },
                    400: function() {
                        console.log("didn't get a password");
                    },
                },
                dataType: 'json'
            });
        }
    </script>
</loadingscreen>
