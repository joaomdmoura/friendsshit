$(document).ready(function() {
	tool_tip_open = false

	$('form').bind("ajax:complete", function(evt, data, status, xhr){
  	if( tool_tip_open )
		{
  		$("#post_plus").click();
  	}
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
	$('#shit_phrase').focus(function() {
	  if (navigator.geolocation) 
		{
			navigator.geolocation.getCurrentPosition( 
		 
				function (position) {  
		 
				mapThisGoogle(position.coords.latitude,position.coords.longitude);
		 
				},
				function (error)
				{
					switch(error.code) 
					{
						case error.TIMEOUT:
							break;
						case error.POSITION_UNAVAILABLE:
							break;
						case error.PERMISSION_DENIED:
							break;
						case error.UNKNOWN_ERROR:
							break;
					}
				}
				);
		}
	});
		
	function mapThisGoogle(latitude,longitude)
	{
		var geocoder = new google.maps.Geocoder();
	 	var latlon = new google.maps.LatLng(latitude, longitude, true);

	  geocoder.geocode( {'location': latlon },
	  function(data, status) {
	  	$("#shit_location").val(data[0].address_components[2].long_name);
	  });
		
	}
});