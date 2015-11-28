<terminal>
  <div id="terminal">Hello</div>

  <script>
    this.on('mount', function(){
      $('#terminal').terminal(function(command, term) {
    if (command == 'test') {
        term.echo("you just typed 'test'");
    } else {
        term.echo('unknown command');
    }
}, { prompt: '>', name: 'test' });

    });
    
  </script>
</terminal>
