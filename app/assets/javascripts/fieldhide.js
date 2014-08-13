$(function () {

  $('#add-users').hide()
    
  $('input').on('ifClicked', function(event){

    if ( $('.checked').html().indexOf("false") !== -1){
    
    $('#add-users').hide()
    }

    if ( $('.checked').html().indexOf("true") !== -1) {
     $('#add-users').show()
  
    }
  });

 







});