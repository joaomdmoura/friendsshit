class ApplicationController < ActionController::Base
  protect_from_forgery

  def fb_oath_token
    @oauth = Koala::Facebook::OAuth.new("368626389864429", "c43ca76ee324061d00ce7c434f59624f", "http://friendsshit.com")
    p @oauth.get_access_token_info(params[:code]) if params[:code]
  end

end
