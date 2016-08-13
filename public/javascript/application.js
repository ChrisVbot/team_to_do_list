$(document).ready(function() {

$(".complete_checkbox").click(function() { 
  if($(this).is(":checked"))
{
  $(this).closest("form").submit();

  }

});

// $( '.checkboxes' ).on( 'click', 'input:checkbox', function () {
//     $( this ).next('label').toggleClass( 'highlight', this.checked );
// });

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
