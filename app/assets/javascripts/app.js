$(document).on("turbolinks:load", function(){
	$('#login').webuiPopover({
    url:'#login_div',
    closeable: true,
    dismissible: false,
    onHide: function(){
      $('#login_error_p').html('');
      $('#login_form').find('input[name="email"]').val('');
      $('#login_form').find('input[name="password"]').val('');
    }
  });
  $('#close_new_team_form').click(function(){
  	$("#new_team_form").hide();
		$(".new_team_link").show();
  })
  $('.new_team_link').click(function(){
    $(".new_team_link").hide();
    $("#new_team_form").show();
  })
  $(".button-collapse").sideNav();
  $(".login_form").submit(function(){
    $.post($(this).attr('action'), $(this).serialize(), function(json){
      if(json.error){
        $('.login_error_p').html(json.error.msg);
      }
    })
    return false;
  })
})