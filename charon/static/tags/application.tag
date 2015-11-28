<application>
  <div id="{ opts.id }" class="content">
    <yield />
  </div>

  <script>
    // Create a Ventus window with the content
    var window = wm.createWindow.fromQuery("#" + opts.id, {
      title: opts.title,
      width: opts.width,
      height: opts.height,
      x: opts.x,
      y: opts.y,
      events: {
        close: function() {
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
