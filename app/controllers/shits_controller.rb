class ShitsController < ApplicationController

  def index
    @shits = Shit.order(:created_at).page(params[:page]).per(6)
  end

  def create
    @shit = Shit.new(params[:shit])
    @shit.save!
    respond_to do |format|
        format.js { render :layout=>false }
    end
  end

end
