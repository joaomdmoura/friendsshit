$(document).ready(function() {
	tool_tip_open = false

	$('form').bind("ajax:complete", function(evt, data, status, xhr){
  	$("#post_plus").click();
  	$("#shit_phrase").val("");
  	$("#friend_name").val("");
	});

	$("#post_plus").click(function() {
		if( tool_tip_open )
		{
			$("#post_plus_tool_tip").animate({
    		opacity: 0,
    		top: "-=15"
  		}, 500, function(){
  			$("#post_plus_tool_tip").css("top", "-140px");
  		})
			tool_tip_open = false
		}
		else {
			$("#post_plus_tool_tip").css("top", "140px").animate({
    		opacity: 1,
    		top: "+=15"
  		}, 500)
			tool_tip_open = true
		}
	});

});