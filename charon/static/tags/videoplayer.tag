<videoplayer>

  <video id="video_area" class="video-js vjs-default-skin"
    controls preload="auto" width="640" height="264"
     <source src={"fs/get"+opts.filepath} type='video/mp4' />

    <p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>
  </video>

  <style scoped>
  </style>

  <script>
    this.on('updated', function () {
      VideoJS(document.getElementById('video_area'), {}, function(){
        // Player (this) is initialized and ready.
        console.log('the video is apparently reading');
      });
    })
  </script>
</videoplayer>
