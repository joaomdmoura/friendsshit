# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  def fb_oath_token
    @oauth = Koala::Facebook::OAuth.new("368626389864429", "c43ca76ee324061d00ce7c434f59624f", "http://friendsshit.com/")
    if !params[:code].nil? || !params[:fb].nil?
      code = ( params[:code] ) ? params[:code] : params[:fb][:code]
      access_token = @oauth.get_access_token(code)
      @graph = Koala::Facebook::API.new(access_token)
      return true
    end
    return false
  end

  def get_fb_friends
    @fb_friends = @graph.get_connections("me", "friends")
  end

end
