$(document).ready(function() {

$(".complete_checkbox").click(function() { 
  if($(this).is(":checked"))
{
  $(this).closest("form").submit();

  }

});


  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});

