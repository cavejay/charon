<terminal>
  <div id="term"></div>

  <script>
    this.on('mount', function(){
      var id = 0;
      // Initialise

      $.ajax({
          type: "POST",
          url: "terminal/open",
          success: function(result) {
            id = result;
            console.log(result);
          }
      });

      $('#term').terminal(function(command, term) {
        console.log(command);
        var bytes = [];

        for (var i = 0; i < command.length; ++i) {
          bytes.push(command.charCodeAt(i));
        }
        $.ajax({
          type: "POST",
          url: "terminal/" + id,
          data: {command},
          success: function(result) {
            console.log(result);
            term.echo(result);
          },
          dataType: "json"
        });

      }, { prompt: '>', name: 'test' });
    });

  </script>

  <style scoped>
    #term {
      height: 100%;
    }
  </style>
</terminal>
