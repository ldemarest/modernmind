$(function () {

  $('#add-users').hide()
    
  $('input').on('ifClicked', function(event){

    if ( $('.checked').html().indexOf("false") !== -1){
    $('#add-users').hide()


    }

    else {
     
  $('#add-users').show()
    }
  });

 







});