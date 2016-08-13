$(document).ready(function() {

$(".complete_checkbox").click(function() { 
  if($(this).is(":checked"))
{
  $(this).closest("form").submit();

  }

});

$('.avatar-container').on('click',function(){
  
  if ($(this).find('.info').length <= 0) {
    $(this).append('<div class="info"><div class="info-inner"></div></div>');
  }
  
  var $info = $(this).find('.info'),
      $inner= $(this).find('.info-inner'),
      $p    = $(this).attr("class").match(/p-\w+/).toString().substring(2);
  
  $inner.text($p+'%');
  $info.toggleClass('js-active');
});

// $( '.checkboxes' ).on( 'click', 'input:checkbox', function () {
//     $( this ).next('label').toggleClass( 'highlight', this.checked );
// });

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});

