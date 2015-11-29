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
            numWindowsOnScreen = numWindowsOnScreen - 1;
          // TODO Tell the app launcher to 'close' this application
        }
      }
    });

    window.open();
  </script>

  <style scoped>
    .content {
      height: 100%;
    }
  </style>
</application>
