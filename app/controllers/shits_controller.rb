class ShitsController < ApplicationController

  def index
    @shits = Shit.order("created_at DESC").page(params[:page]).per(6)
  end

  def create
    @friend       = Friend.new( params[:friend] )
    @shit         = Shit.new( params[:shit] )
    @friend.shit  = @shit

    @shit.save!
    @friend.save!

    respond_to do |format|
        format.js { render :layout=>false }
    end
  end

end
