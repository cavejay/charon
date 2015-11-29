<terminal>
  <div id="term"></div>

  <script>
    this.on('mount', function(){
      var id = 0;

      $('#terminal').parents('.wm-content').css('background-color', 'black');
      $.ajax({
          type: "POST",
          url: "terminal/open",
          success: function(result) {
            id = result;
          }
      });

      $('#term').terminal(function(command, term) {

        $.ajax({
          type: "POST",
          url: "terminal/" + id,
          data: {'username': username, 'password': password},
          success: function(result) {
            term.echo(result['output']);
            $('#terminal').parents('.wm-content').animate({ scrollTop: $(document).height() }, "fast");
          },
          dataType: 'json'
        });

      }, { prompt: '> ', name: 'test' });


    });

  </script>

  <style scoped>
    #term {
      height: 100%;
    }
  </style>
</terminal>
