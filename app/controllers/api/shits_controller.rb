class Api::ShitsController < ApplicationController

  def get_shits

    @shits = Shit.select("shits.*, friends.*").joins(:friends).order("shits.created_at DESC").page(params[:page]).per(params[:per_page])
    @shits.map! {|x| x[:photo_url] = Friend.find([x.id])[0].photo.thumb('120x122#').url; x }
    render :json => @shits

  end

  def create_shit

    params[:shit]   = { :phrase => params[:phrase], :location => (params[:location]) ? params[:location] : "" } if params[:shit].nil?

    params[:friend] = { :name => params[:name], :fb_ib => ( params[:fb_ib] ) ? params[:fb_ib] : "" , :photo_url => ( params[:photo_url] ) ? params[:photo_url] : "" } if params[:friend].nil?

    @shit = Shit.new( params[:shit] )


    params[:friend][:photo_url] = ( params[:friend][:photo_url] != "" ) ? params[:friend][:photo_url] : "https://friendsquotes.herokuapp.com/assets/troll/#{ 1 + rand(12) }.png"
    params[:friend][:name] = ( params[:friend][:name] != "" ) ? params[:friend][:name] : "Anonymous"
    @friend       = Friend.new( params[:friend] )
    @friend.shit  = @shit
    @friend.save!

    @shit.save!

    if params[:friend][:fb_ib] != ""
      fb_oath_token
      shit_obj = {  "name"        => "Friend's Shit - Cuz shit happens!",
                    "link"        => "https://friendsquotes.herokuapp.com/shit/#{@shit.id}",
                    "caption"     => "A place to share yout friends shit and get some fun of others shits!",
                    "description" => "'#{@shit.phrase} %>'- #{@shit.friends[0].name}",
                    "picture"     => @shit.friends[0].photo.thumb('160x160#').url}

      @graph.put_wall_post("", {:link => "https://friendsquotes.herokuapp.com/shit/#{@shit.id}"})
      @graph.put_wall_post("", {:link => "https://friendsquotes.herokuapp.com/shit/#{@shit.id}"}, "#{params[:friend][:fb_ib]}")
    end

    @shit[:friend] = @friend

    render :json => @shit

  end

end
