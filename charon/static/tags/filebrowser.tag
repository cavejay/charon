<filebrowser>
  <toolbar class="toolbar">
    <toolbar-button onclick={ parent.back } class="button-back" icon="arrow-left" unclickable={ parent.historyIndex < 0 } /><toolbar-button class="button-forward" icon="arrow-right" unclickable={ parent.history.length === 0 }/><toolbar-breadcrumbs class="breadcrumbs" id="breadcrumbs" path={ parent.pwd } /><toolbar-button class="button-new" icon="plus" />
  </toolbar>
  <filelist class="filelist" files={ files } />

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

      console.log(url);

      $.ajax({url: url, success: function(result){
        self.files = result.data;
        self.update();
      }});
    }

    openFileOrDirectory(event) {

      console.log(event);
      if (event.item.isFile) {
        // TODO open file
      } else {
        // Destroy all the future history
        this.history = this.history.slice(0, this.historyIndex + 1);
        this.history.push(this.pwd);
        console.log(this.history);
        this.historyIndex++;
        if (this.pwd == "/") {
          this.pwd += event.item.name;
        } else {
          this.pwd += "/" + event.item.name;
        }
        console.log(this.pwd);
        this.fetchFiles();
        console.log(this.historyIndex);
      }
    }

    back() {
      console.log('back');
      if (this.historyIndex >= 0) {
        console.log(this.history);
        this.pwd = this.history[this.historyIndex];
        this.historyIndex--;
        this.fetchFiles();
      }
    }

    forward() {

    }

    this.fetchFiles();

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
