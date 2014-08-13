  

  function saveDrawing(){
    // gets mind id
    var pathname = window.location.pathname;
    var id = pathname.replace ( /[^\d.]/g, '' );
    var url = document.URL;

    // gets neuron name 
    var name = $('#neuron-name').val()


     // Generate the image data
    var Pic = document.getElementById("processing-canvas").toDataURL("image/png");
    Pic = Pic.replace(/^data:image\/(png|jpg);base64,/, "");
    var neuron_json = JSON.stringify({"neuron" : {"image": Pic, "name": name }, "user_mind" : {"mind_id": id}});


    if(name !== ""){
    // Sending the image data to Server
    $.ajax({
      type: 'POST',
      url: '/minds/'+id+'/neurons',
      data: neuron_json,
      contentType: 'application/json; charset=utf-8',
      dataType: 'json',
      success: function (msg) {

        $('#modal-body').append('<a href ='+url+'>'+ url+'</a>');

        $('#modal-close').click(function(){
          window.location = '/minds/'+id;
        });

        $('#neuronModal').modal('show');

        }
        });
    }
     else {
      $('#neuron-name').css({"border-color": "#FF0000", 
             "border-width":"4px", 
             "border-style":"solid"});
    }
  }

