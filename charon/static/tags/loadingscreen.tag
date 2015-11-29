<loadingscreen>
    <div id="loading-screen" unselectable="on">
        <section>
            <div class="content">
                <header>
                    <h1 id='title'>C H A R O N</h1>
                </header>
                <div if={ !loggedIn } style="font-family: 'Iceland', cursive;">
                    <input class="loginbox" id="box_username" type="text" name="username" placeholder="Username" required>
                    <span class="loginbox" style="margin-left: 20px;">
                        <input type="password" name="password" id="box_password"  placeholder="Password" required>
                    </span>
                    <input type="submit" style="display:none"/>
                </div>
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
        input:focus {
            outline-color: #BABABA;
        }
    </style>

    <script>
        this.loggedIn = false;
        flipLoading(){this.loggedIn ? false : true}

        // Hide loader when loaded
        $(document).keypress(function (e) {
            this.loggedIn = true;
            if (e.which == 13) {
                var loader = $("#loading-screen");
                loader.addClass('hide');
                loader.on(Ventus.browser.animationEventName(), function() {
                    loader.hide();
                });

                // $.ajax({
                //     type: "POST",
                //     url: "/login",
                //     data: {'username': $('#box_username').val(), 'password': $('#box_password').val()},
                //     success: function(result) {
                //         this.flipLoading();
                //         var loader = $("#loading-screen");
                //         loader.addClass('hide');
                //         loader.on(Ventus.browser.animationEventName(), function() {
                //             loader.hide();
                //         });
                //     },
                //     statusCode: {
                //         404: function() {
                //             alert( "page not found" );
                //         },
                //         401: function() {
                //             console.log("U GOT WORNG U SCRUB");
                //             this.flipLoading()
                //         },
                //         400: function() {
                //             console.log("didn't get a password");
                //             this.flipLoading();
                //         },
                //     },
                //     dataType: 'json'
                // });
            }
        });
    </script>
</loadingscreen>
