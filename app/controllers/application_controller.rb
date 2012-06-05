# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  def fb_oath_token
    @oauth = Koala::Facebook::OAuth.new("368626389864429", "c43ca76ee324061d00ce7c434f59624f", "http://friendsshit.com/")
    if params[:code] || params[:fb]
      access_token = @oauth.get_app_access_token
      @user_fid = @oauth.get_user_from_cookies(cookies)
      @graph    = Koala::Facebook::API.new(access_token)
      return true
    end
    return false
  end

  def get_fb_friends
    @fb_friends = @graph.get_connections(@user_fid, "friends")
  end

end
