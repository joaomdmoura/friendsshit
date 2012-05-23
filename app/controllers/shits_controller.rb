class ShitsController < ApplicationController

  def index
    @shits = Shit.order(:created_at).page(params[:page]).per(6)
  end

  def create
    shit = Shit.new(params[:shit]).save!
  end

end
