$(document).ready(function() {
  tool_tip_open = false
  var current_page = 2

  $('form').bind("ajax:complete", function(evt, data, status, xhr){
    $("#loading").fadeOut(200);
    $("#fb_pic").fadeOut(200);
     if( tool_tip_open )
    {
      $("#post_plus").click();
    }
  $("#shit_phrase").val("");
  $("#friend_name").val("");
  });

  $('form').bind("ajax:beforeSend", function(evt, data, status, xhr){
    $("#loading").fadeIn(200);
  });

  $('form').bind("ajax:error", function(evt, data, status, xhr){
    $("#loading").fadeOut(200);
  });

  $("li.friend").click(function(){
    url = "/shit/" + $(this).find(".this_shit").attr("id");
    window.location = url;
  });

  $("#buscar_btn").click(function(){
    $(".fb_friends_photo").remove();
    $("#ajax_loader_fb").fadeIn(200);
    friend_name = $("#find_friend_name").val();
    friends_found = [];
    $.each(friends, function() {
      pattern = ".*" + friend_name + ".*";
      friend_match = this.name.match(new RegExp(pattern, "gi"));
      if( friend_match ){
        friends_found.push(this);
      }
    });
    $.each(friends_found, function() {
      $("#all_fb_friends").append("<div id='"+this.name+"' class='fb_friends_photo glass'><div id='"+this.id+"'><img src='https://graph.facebook.com/"+this.id+"/picture?type=large'/></div></div>")
    });
    setTimeout(function(){
      $.each($(".fb_friends_photo img"), function() {
        resize_image(this, 122, 124);
      });
      $("#ajax_loader_fb").fadeOut(200, function(){
        $(".fb_friends_photo").animate({opacity: 1}, 200)
      });
      $('#all_fb_friends .fb_friends_photo').click(function(){
        resize_image($(this).find('img'), 50, 50);
        img = $(this).find('img');
        $("#fb_pic div").append( img );
        $("#fb_pic").fadeIn(200);
        $("#friend_name").val($(this).attr('id'));
        $(".fb_ib").val($(this).find("div").attr('id'));
        $('.photo_friends').val(img.attr("src"));
        $("#fb_post_plus_tool_tip").animate({
            opacity: 0,
            top: "-=15"
          }, 200, function(){
            $("#fb_post_plus_tool_tip").css("top", "-1400px");
        });
      })
    }, 1500);
  });

  function resize_image(image, height, width) {
    old_width       = parseInt($(image).css("width"));
    old_height      = parseInt($(image).css("height"));
    h_porportion    =  old_height / old_width;
    w_porportion    =  old_width / old_height;
    if (h_porportion > w_porportion){
      n_height      = height * h_porportion;
      n_width       = height;
    }
    else {
      n_width       = width  * w_porportion;
      n_height      = width;
    }
    $(image).css("width", n_width);
    $(image).css("height", n_height);
  }

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

  $(document).infiniteScrolling({
    loadCallback: function(){
      $('<div/>').load('/?page='+current_page+' #shits li.friend',function(){
        $(this).appendTo('#shits');    // once they're loaded, append them to our content area
      });
      current_page = current_page + 1;
    },
    marginThreshold: 500,
  });

});
