class Api::ShitsController < ApiController

  def get_shits
    
    @shits = Shit.select("shits.*, friends.*").joins(:friends)
    @shits.map! {|x| x[:photo_url] = Friend.find([x.id])[0].photo.thumb('120x122#').url; x }
    render :json => @shits

    #@shits = Shit.all
    #render json: @friends.as_json(include: {:friends => {methods: [:thumb]]})

  end

  def create_shit
    
    @shit = Shit.new( params[:shit] )
    
    params[:friend][:photo_url] = ( params[:friend][:photo_url] != "" ) ? params[:friend][:photo_url] : "http://www.friendsshit.com/assets/troll/#{ 1 + rand(12) }.png"
    params[:friend][:name] = ( params[:friend][:name] != "" ) ? params[:friend][:name] : "Anonymous"
    @friend       = Friend.new( params[:friend] ) 
    @friend.shit  = @shit
    @friend.save!

    @shit.save!

    if params[:friend][:fb_ib] != ""
      fb_oath_token
      shit_obj = {  "name"        => "Friend's Shit - Cuz shit happens!",
                    "link"        => "http://www.friendsshit.com/shit/#{@shit.id}",
                    "caption"     => "A place to share yout friends shit and get some fun of others shits!",
                    "description" => "'#{@shit.phrase} %>'- #{@shit.friends[0].name}",
                    "picture"     => @shit.friends[0].photo.thumb('160x160#').url}

      @graph.put_wall_post("", {:link => "http://www.friendsshit.com/shit/#{@shit.id}"})
      @graph.put_wall_post("", {:link => "http://www.friendsshit.com/shit/#{@shit.id}"}, "#{params[:friend][:fb_ib]}")
    end
    
    render :json => @shit

  end

end