<videoplayer>

  <video id="video_area" class="video-js vjs-default-skin"
    controls preload="auto"
     <source src={"fs/get"+opts.filepath} type='video/mp4' />
  </video>

  <style scoped>
    video {
      width: 100%;
    }
  </style>

  <script>
    var self = this;


    this.on('updated', function () {
      console.log('updated? video')
      self.playerInst = VideoJS(document.getElementById('video_area'), {}, function(){
        // Player (this) is initialized and ready.
        console.log('the video is apparently reading');

      });
      console.log('this is a thing?')
      for (var i of wm.windows) {
        if (i.$content[0].firstChild.id == self.parent.root.id){
          console.log("Found me!")
          console.log("current: "+i.width+", "+i.height);
          console.log("needs: "+self.playerInst.dimension('width')+", "+self.playerInst.dimension('height'));
          i.width = self.playerInst.dimension('width');
          i.height = self.playerInst.dimension('height');
        }
      }//i.hieght and i.width
    })

    // Resize Ventus

  </script>
</videoplayer>
