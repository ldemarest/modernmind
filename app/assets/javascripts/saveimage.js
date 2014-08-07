  

  function saveDrawing(){
    // gets mind id
    var pathname = window.location.pathname;
    var id = pathname.replace ( /[^\d.]/g, '' );

    // gets neuron name 
    var name = $('#neuron-name').val()


     // Generate the image data
    var Pic = document.getElementById("processing-canvas").toDataURL("image/png");
    Pic = Pic.replace(/^data:image\/(png|jpg);base64,/, "");



    // Sending the image data to Server
    $.ajax({
      type: 'POST',
      url: '/minds/'+id+'/neurons',
      data: '{ "image" : "' + Pic + '" ,"mind_id" : "' + id + '","name":"' + name + '"  }',
      contentType: 'application/json; charset=utf-8',
      dataType: 'json',
      success: function (msg) {
          alert("Done, Picture Uploaded.");
      }

      });

  }
