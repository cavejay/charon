<imageviewer>

    <div>
        <img id="image" src={"fs/get"+opts.filepath}>
    </div>

    <style scoped>
    img {
      max-height: 100%;
      max-width: 100%;
    }
  </style>
  <script>

    this.on('updated', function() {

    for (var i of wm.windows) {
       if (i.$content[0].firstChild.id == this.parent.root.id){
         console.log("Found me!")

         if (opts.filepath != undefined){

            console.log("Height and Width " + this.image.height + ", " + this.image.width);
         }
       }
    }

    });
  </script>

</imageviewer>
