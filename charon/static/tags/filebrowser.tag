<filebrowser>
  <toolbar class="toolbar">
    <toolbar-button class="button-back" icon="arrow-left" /><toolbar-button class="button-forward" icon="arrow-right" /><toolbar-breadcrumbs class="breadcrumbs" id="breadcrumbs" path="/home" /><toolbar-button class="button-new" icon="plus" />
  </toolbar>

  <filelist class="filelist" files={ files } />

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

  <script>

    this.files = [
      {}, //FIXME
      {
        "isFile": true,
        "lastModified": "Fri Nov 27 20:33:53 2015",
        "name": ".bash_history",
        "size": 2111
      },
      {
        "isFile": true,
        "lastModified": "Sat Nov  7 21:26:14 2015",
        "name": ".bash_profile",
        "size": 73
      },
      {
        "isFile": false,
        "lastModified": "Sat Nov 28 11:13:38 2015",
        "name": ".bash_sessions",
        "size": 1122
      },
      {
        "isFile": true,
        "lastModified": "Fri Nov  6 13:39:34 2015",
        "name": ".CFUserTextEncoding",
        "size": 7
      },
      {
        "isFile": false,
        "lastModified": "Sat Nov  7 21:26:03 2015",
        "name": ".continuum",
        "size": 68
      },
      {
        "isFile": false,
        "lastModified": "Thu Nov 12 05:58:41 2015",
        "name": ".cups",
        "size": 102
      },
      {
        "isFile": true,
        "lastModified": "Sat Nov 28 13:38:23 2015",
        "name": ".DS_Store",
        "size": 14340
      },
      {
        "isFile": true,
        "lastModified": "Fri Nov 27 20:24:11 2015",
        "name": ".gitconfig",
        "size": 59
      },
      {
        "isFile": false,
        "lastModified": "Fri Nov  6 14:11:58 2015",
        "name": ".idlerc",
        "size": 102
      },
      {
        "isFile": false,
        "lastModified": "Sat Nov 28 12:14:49 2015",
        "name": ".ipython",
        "size": 170
      },
      {
        "isFile": false,
        "lastModified": "Mon Nov 23 17:17:52 2015",
        "name": ".local",
        "size": 102
      },
      {
        "isFile": false,
        "lastModified": "Fri Nov 27 20:22:38 2015",
        "name": ".matplotlib",
        "size": 68
      },
      {
        "isFile": false,
        "lastModified": "Fri Nov 27 20:20:24 2015",
        "name": ".PyCharm50",
        "size": 102
      },
      {
        "isFile": true,
        "lastModified": "Tue Nov 24 19:31:40 2015",
        "name": ".python_history",
        "size": 22
      },
      {
        "isFile": false,
        "lastModified": "Wed Nov 25 09:06:58 2015",
        "name": ".Trash",
        "size": 1020
      },
      {
        "isFile": false,
        "lastModified": "Tue Nov 24 19:16:04 2015",
        "name": ".vim",
        "size": 136
      },
      {
        "isFile": true,
        "lastModified": "Thu Nov 26 20:31:28 2015",
        "name": ".viminfo",
        "size": 9899
      },
      {
        "isFile": true,
        "lastModified": "Tue Nov 24 20:31:59 2015",
        "name": ".vimrc",
        "size": 1419
      },
      {
        "isFile": false,
        "lastModified": "Fri Nov  6 13:50:39 2015",
        "name": "Applications",
        "size": 136
      },
      {
        "isFile": false,
        "lastModified": "Sat Nov 28 11:14:57 2015",
        "name": "Desktop",
        "size": 238
      },
      {
        "isFile": false,
        "lastModified": "Fri Nov  6 13:39:32 2015",
        "name": "Documents",
        "size": 102
      },
      {
        "isFile": false,
        "lastModified": "Sat Nov 28 11:33:19 2015",
        "name": "Downloads",
        "size": 1156
      },
      {
        "isFile": false,
        "lastModified": "Sat Nov 28 13:36:21 2015",
        "name": "HelloWorld",
        "size": 204
      },
      {
        "isFile": false,
        "lastModified": "Tue Nov 24 18:54:45 2015",
        "name": "Library",
        "size": 1768
      },
      {
        "isFile": false,
        "lastModified": "Fri Nov  6 13:39:32 2015",
        "name": "Movies",
        "size": 102
      },
      {
        "isFile": false,
        "lastModified": "Fri Nov  6 13:39:32 2015",
        "name": "Music",
        "size": 102
      },
      {
        "isFile": false,
        "lastModified": "Wed Nov 25 16:32:57 2015",
        "name": "OneDrive",
        "size": 578
      },
      {
        "isFile": false,
        "lastModified": "Fri Nov  6 13:39:32 2015",
        "name": "Pictures",
        "size": 102
      },
      {
        "isFile": false,
        "lastModified": "Fri Nov  6 13:39:32 2015",
        "name": "Public",
        "size": 170
      },
      {
        "isFile": false,
        "lastModified": "Sat Nov 28 12:45:20 2015",
        "name": "temp",
        "size": 68
      },
      {
        "isFile": false,
        "lastModified": "Fri Nov 27 20:31:59 2015",
        "name": "venv",
        "size": 102
      },
      {
        "isFile": false,
        "lastModified": "Tue Nov 24 19:20:41 2015",
        "name": "ycm_build",
        "size": 68
      }
    ];
  </script>

</filebrowser>
