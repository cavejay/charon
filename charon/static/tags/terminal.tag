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
        $.ajax({
          type: "POST",
          url: "terminal/" + id ,
          success: function(result){
            console.log(result);
            term.echo(result);
          }
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
