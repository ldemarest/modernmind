$(function () {

  $('#upvote-button').click(function(){
    alert("poop")

    var pathname = window.location.pathname;
    var id = pathname.replace ( /[^\d.]/g, '' );
    var mind_json = JSON.stringify({"mind" : {"mind_id": id}});

    // Sending the image data to Server
    $.ajax({
      type: 'PATCH',
      url: '/minds/'+id ,
      data: mind_json,
      contentType: 'application/json; charset=utf-8',
      dataType: 'json',
      success: function (msg) {
        alert("Done, Picture Uploaded.");
      }

      });



  });


});