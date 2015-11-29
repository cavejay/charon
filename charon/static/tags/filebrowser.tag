<filebrowser>
  <toolbar class="toolbar">
    <toolbar-button onclick={ parent.back } class="button-back" icon="arrow-left" unclickable={ parent.historyIndex < 1 } /><toolbar-button onclick={ parent.forward } class="button-forward" icon="arrow-right" unclickable={ parent.historyIndex >= (parent.history.length - 1) }/><toolbar-breadcrumbs class="crumbs" id="breadcrumbs" path={ parent.pwd } /><toolbar-button class="button-new" icon="plus" />
  </toolbar>
  <filelist class="filelist" files={ files } pwdHack={ pwdHack }/>

  <script>
    var self = this;

    this.pwd = "/";
    this.history = [];
    this.historyIndex = -1;

    fetchFiles() {
      var url = "fs/list";

      if (this.pwd !== "/") {
        url += this.pwd;
      }

      Charon.pwdmegahack = this.pwd;

      console.log(url);

      $.ajax({url: url, success: function(result){
        self.files = result.data;
        self.pwdHack = this.pwd;
        self.update();
      }});
    }

    openFileOrDirectory(event) {
      if (event.item.isFile) {

        var filepath = this.pwd;

        if (filepath == "/") {
          filepath += event.item.name;
        } else {
          filepath += "/" + event.item.name;
        }

        makeAppInstance("texteditor", { filepath: filepath } );
      } else {
        // Destroy all the future history
        this.history = this.history.slice(0, this.historyIndex + 1);

        if (this.pwd == "/") {
          this.pwd += event.item.name;
        } else {
          this.pwd += "/" + event.item.name;
        }

        self.history.push(self.pwd);
        self.historyIndex++;
        this.fetchFiles();
      }
    }

    back() {
      console.log('back');
      if (this.historyIndex > 0) {
        console.log(this.history);
        // this.history.push(this.pwd);
        this.historyIndex--;
        this.pwd = this.history[this.historyIndex];
        this.fetchFiles();
      }
    }

    forward() {
      if (this.historyIndex < (this.history.length - 1)) {
        console.log("forward");
        console.log(this.historyIndex);
        console.log(this.history);
        this.historyIndex++;
        this.pwd = this.history[this.historyIndex];
        console.log(this.pwd)
        this.fetchFiles();
      }
    }

    this.fetchFiles();
    this.history.push(this.pwd);
    this.historyIndex++;

    this.on('mount', function() {
      $(".crumbs").keyup(function (e) {
        if (e.keyCode == 13) {
          console.log('keyup');

          self.history = self.history.slice(0, self.historyIndex + 1);
          self.pwd = e.target.value;
          self.history.push(self.pwd);
          self.historyIndex++;
          self.fetchFiles();
        }
      });
    });

  </script>

  <style scoped>
    .toolbar {
      position:absolute;
      width: 100%;
      background-color: #FFFFFF;
      -webkit-box-shadow: 0px 2px 8px 0px rgba(0,0,0,0.75);
      -moz-box-shadow: 0px 2px 8px 0px rgba(0,0,0,0.75);
      box-shadow: 0px 2px 8px 0px rgba(0,0,0,0.75);
    }

    .button-new,
    .button-forward,
    #breadcrumbs,
    .button-new {
      display: inline-block;
    }

    .filelist {
      overflow:auto;
    }
  </style>
</filebrowser>
