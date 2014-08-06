  function saveDrawing(){

    var pathname = window.location.pathname;
    var id = pathname.replace ( /[^\d.]/g, '' );



     // Generate the image data
    var Pic = document.getElementById("processing-canvas").toDataURL("image/png");
    Pic = Pic.replace(/^data:image\/(png|jpg);base64,/, "");

    // Sending the image data to Server
    $.ajax({
      type: 'POST',
      url: '/minds/'+id+'/neurons',
      data: '{ "image" : "' + Pic + '" ,"mind_id" : "' + id + '" }',
      contentType: 'application/json; charset=utf-8',
      dataType: 'json',
      success: function (msg) {
          alert("Done, Picture Uploaded.");
      }

      });

  }
