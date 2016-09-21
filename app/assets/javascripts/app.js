$(document).on("turbolinks:load", function(){
	$('#login').webuiPopover({
    url:'#login-form',
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
})