class FacebookController < ApplicationController

  def oath_token 
    @oauth = Koala::Facebook::OAuth.new("368626389864429", "c43ca76ee324061d00ce7c434f59624f", "http://www.friendsshit.com")
  end

end
