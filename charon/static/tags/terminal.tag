<terminal>
  <div id="term{ id }"></div>

  <script>
    this.on('mount', function(){
      this.id = 0;

      var self = this;

      $('#terminal').parents('.wm-content').css('background-color', 'black');
      $.ajax({
          type: "POST",
          url: "terminal/open",
          success: function(result) {
            self.id = result;
            self.update();

            $('#term' + self.id).terminal(function(command, term) {

        $.ajax({
          type: "POST",
          url: "terminal/" + self.id,
          data: {command},
          success: function(result) {
            term.echo(result['output']);
            $("select[name='Terminal']").parents('.wm-content').animate({ scrollTop: $(document).height() }, "fast");
          },
          dataType: 'json'
        });

      }, { prompt: '> ', name: 'test' });
          }
      });

      
    });

  </script>

  <style scoped>
    #term {
      height: 100%;
    }
  </style>
</terminal>
