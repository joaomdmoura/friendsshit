class ShitsController < ApplicationController

  def index
    get_fb_friends if fb_oath_token
    @shits      = Shit.order("created_at DESC").page(params[:page]).per(6)
    page        = (params[:page]) ? params[:page].to_i : 1
    @next_page  = (page >= (Shit.count().to_f / 6)) ? 1 : page + 1
  end

  def create
    @shit = Shit.new( params[:shit] )

    params[:friend][:photo_url] = ( params[:friend][:photo_url] != "" ) ? params[:friend][:photo_url] : "https://friendsquotes.herokuapp.com/assets/troll/#{ 1 + rand(12) }.png"
    params[:friend][:name] = ( params[:friend][:name] != "" ) ? params[:friend][:name] : "Anonymous"

    @friend       = Friend.new( params[:friend] )
    @friend.shit  = @shit

    if @shit.save! && @friend.save! && !@friend.fb_ib.nil?
      params[:code] = params[:fb][:code]
      @graph        = fb_oath_token
      shit_obj = {  "name"        => "Friend's Shit - Cuz shit happens!",
                    "link"        => "https://friendsquotes.herokuapp.com/shit/#{@shit.id}",
                    "caption"     => "A place to share yout friends shit and get some fun of others shits!",
                    "description" => "'#{@shit.phrase} %>'- #{@friend.name}",
                    "picture"     => @friend.photo.thumb('160x160#').url}

      @graph.put_wall_post("", {:link => "https://friendsquotes.herokuapp.com/shit/#{@shit.id}"})
      @graph.put_wall_post("", {:link => "https://friendsquotes.herokuapp.com/shit/#{@shit.id}"}, "#{params[:friend][:fb_ib]}")
    end

    respond_to do |format|
        format.js { render :layout=>false }
    end
  end

  def show
    index
    @shit = Shit.find(params[:id]);
  end

end
