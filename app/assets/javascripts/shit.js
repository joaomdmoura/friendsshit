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

  $("#buscar_btn").click(function(){
    friend_name = $("#find_friend_name").val();
    friends_found = [];
    $.each(friends, function() {
      pattern = ".*" + friend_name + ".*";
      friend_match = this.name.match(new RegExp(pattern, "gi"));
      if( friend_match ){
        friends_found.push(this);
      }
    });
    $(".fb_friends_photo").remove();
    $.each(friends_found, function() {
      $("#all_fb_friends").append("<div class='fb_friends_photo glass'><div><img src='https://graph.facebook.com/"+this.id+"/picture?type=large'/></div></div>")
      img = $(".fb_friends_photo img")
      img = img[img.length-1]
      width       = parseInt($(img).css("width"));
      height      = parseInt($(img).css("height"));
      h_porportion  =  height / width;
      w_porportion  =  width / height;
      if (h_porportion > w_porportion){
        n_height    = 124 * h_porportion;
        n_width     = 124;
      }
      else {
        n_width     = 122  * w_porportion;  
        n_height    = 122;
      }
      $(img).css("width", n_width);
      $(img).css("height", n_height);
    });
    $.each($(".fb_friends_photo img"), function() {
      width       = parseInt($(this).css("width"));
      height      = parseInt($(this).css("height"));
      h_porportion  =  height / width;
      w_porportion  =  width / height;
      if (h_porportion > w_porportion){
        n_height    = 124 * h_porportion;
        n_width     = 124;
      }
      else {
        n_width     = 122  * w_porportion;  
        n_height    = 122;
      }
      $(this).css("width", n_width);
      $(this).css("height", n_height);
    });
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
      $("#fb_post_plus_tool_tip").animate({
        opacity: 0,
        top: "-=15"
      }, 200, function(){
        $("#fb_post_plus_tool_tip").css("top", "-1400px");
      })
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