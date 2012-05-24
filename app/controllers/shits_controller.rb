class ShitsController < ApplicationController

  def index
    @shits = Shit.order("created_at DESC").page(params[:page]).per(6)
  end

  def create
    @shit         = Shit.new( params[:shit] )
    
    if params[:friend][:name] != ""
      @friend       = Friend.new( params[:friend] ) 
      @friend.shit  = @shit
      @friend.save!
    end

    @shit.save!

    respond_to do |format|
        format.js { render :layout=>false }
    end
  end

end
