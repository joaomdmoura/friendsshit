class ShitsController < ApplicationController

  def index
    get_fb_friends if fb_oath_token
    @shits      = Shit.order("created_at DESC").page(params[:page]).per(6)
    page        = (params[:page]) ? params[:page].to_i : 1
    @next_page  = (page >= (Shit.count().to_f / 6)) ? 1 : page + 1 
  end

  def create
    @shit = Shit.new( params[:shit] )
    
    if params[:friend][:name] != ""
      params[:friend][:photo_url] = ( params[:friend][:photo_url] != "" ) ? params[:friend][:photo_url] : "http://wwww.friendsshit.com/assets/troll/#{ 1 + rand(12) }.png"
      @friend       = Friend.new( params[:friend] ) 
      @friend.shit  = @shit
      @friend.save!
    end

    @shit.save!

    respond_to do |format|
        format.js { render :layout=>false }
    end
  end

  def show
    index
    @shit = Shit.find(params[:id]);
  end

end
