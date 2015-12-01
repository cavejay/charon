<texteditor>
  <toolbar class="toolbar">
    <toolbar-button onclick={ parent.save } class="button-back" icon="floppy" unclickable={ !parent.fileChanged } />
  </toolbar>
  <textarea class={ editor-text: true, full-height: true }>{ text }</textarea>

  <script>
    var self = this;

    this.fileChanged = false;

    this.on('mount', function() {

      $(':input', this.root).bind('input propertychange', function() {
        self.fileChanged = true;
        self.update();
      });

      console.log(opts.filepath);
      if (typeof opts.filepath !== "undefined") {
        console.log('lets get');

        var url = 'fs/get' + opts.filepath;
        console.log(url);

        $.ajax({
          type: "POST",
          url: url,
          success: function(result){
            self.text = result;
            self.update();
        }});
      }
    });

    save(event) {
      if (this.fileChanged) {

        var newText = $('.editor-text').val();

        console.log(newText);
        console.log(self.text);

        $.ajax({
          type: "POST",
          url: 'fs/pack' + opts.filepath,
          data: {'text': newText},
          dataType: "json"
        });
      }
    }
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
