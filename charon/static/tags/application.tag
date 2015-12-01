<application>
  <yield />

  <script>
    // Create a Ventus window with the content
    var window = wm.createWindow.fromQuery("#" + opts.id, {
      title: opts.title,
      width: opts.w,
      height: opts.h,
      x: parseInt(opts.x),
      y: parseInt(opts.y),
      events: {
        close: function() {
            Charon.numApps = Charon.numApps - 1;
          // TODO Tell the app launcher to 'close' this application
        }
      }
    });

    window.open();

    this.on('unmount', function() {
      Charon.numApps = Charon.numApps - 1;
    });
  </script>

  <style scoped>
    .content {
      height: 100%;
    }
  </style>
</application>
