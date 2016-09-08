$(function(){
	// $('.modal-trigger').leanModal();
	$('#new_team_form').hide();
	$('.dropdown-button').dropdown();
	$('#login').webuiPopover({url:'#login-form'});
})

$(document).on("click", ".new_team_link", function(e){
	$(".new_team_link").hide();
	$("#new_team_form").show();
	e.preventDefault();
})

$(document).on("click", "#close_new_team_form", function(e){
	$("#new_team_form").hide();
	$(".new_team_link").show();
	e.preventDefault();
})