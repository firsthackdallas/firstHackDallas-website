$(document).on("turbolinks:load", function(){
	$('#login').webuiPopover({
    url:'#login_div',
    closeable: true,
    dismissible: false
  });
  $('#close_new_team_form').click(function(){
  	$("#new_team_form").hide();
		$(".new_team_link").show();
		e.preventDefault();
  })
  $('.new_team_link').click(function(){
    $(".new_team_link").hide();
    $("#new_team_form").show();
    e.preventDefault();
  })
  $(".button-collapse").sideNav();
  $("#login_form").submit(function(){
  $.post($(this).attr('action'), $(this).serialize(), function(json){
    console.log(json);
    if(json.error){
      $('#login_error_p').html(json.error.msg)
      //use jquery for errrs on html
    }
  })
  return false;
  // e.preventDefault();
})
})