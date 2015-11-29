<texteditor>
  <textarea class={ editor-text: true, full-height: true }>
    { text }
  </textarea>

  <script>
    var self = this;

    this.on('mount', function() {
      console.log(opts.filepath);
      if (typeof opts.filepath !== "undefined") {
        console.log('lets get');

        var url = 'fs/get' + opts.filepath;
        console.log(url);

        $.ajax({
          type: "GET",
          url: url,
          success: function(result){
            self.text = result;
            self.update();
        }});
      }
    });
  </script>

  <style>
    textarea {
      outline: none;
      width: 100%;
    }

    .full-height {
      height: 1000px; /* ¯\_(ツ)_/¯ */
    }
  </style>
</texteditor>
