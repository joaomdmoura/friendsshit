class ApplicationController < ActionController::Base
  protect_from_forgery

  def fb_oath_token
    @oauth = Koala::Facebook::OAuth.new("368626389864429", "c43ca76ee324061d00ce7c434f59624f", "http://friendsshit.com/")
    if params[:code]
    	p @oauth.url_for_access_token(params[:code])
    	p @oauth.get_app_access_token
    end
  end

end
