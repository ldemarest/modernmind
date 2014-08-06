   // $('submit').click(function(){
$('#save_image_mind').click(function(){
    function saveDrawingMind(){

     // Generate the image data
    var Pic = document.getElementById("processing-canvas").toDataURL("image/png");
    Pic = Pic.replace(/^data:image\/(png|jpg);base64,/, "")

    // Sending the image data to Server
    $.ajax({
        type: 'POST',
        url: '/minds',
        data: '{ "image" : "' + Pic + '" }',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (msg) {
            alert("Done, Picture Uploaded.");
        }
    });
   }
 });