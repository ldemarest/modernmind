  

  function saveDrawing(){
    // gets mind id
    var pathname = window.location.pathname;
    var id = pathname.replace ( /[^\d.]/g, '' );

    // gets neuron name 
    var name = $('#neuron-name').val()


     // Generate the image data
    var Pic = document.getElementById("processing-canvas").toDataURL("image/png");
    Pic = Pic.replace(/^data:image\/(png|jpg);base64,/, "");
    var neuron_json = JSON.stringify({"neuron" : {"image": Pic, "name": name }, "user_mind" : {"mind_id": id}});


    // Sending the image data to Server
    $.ajax({
      type: 'POST',
      url: '/minds/'+id+'/neurons',
      // data: '{neuron :{ "image" : "' + Pic + '" ,"mind_id" : "' + id + '","name":"' + name + '", "crazy_eyes" : "MWAHAHAHAHAAH"}',
      data: neuron_json,
      contentType: 'application/json; charset=utf-8',
      dataType: 'json',
      success: function (msg) {
        alert("Done, Picture Uploaded.");
      }

      });

  }
