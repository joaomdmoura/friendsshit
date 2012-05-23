class ShitsController < ApplicationController

	def index
		@shits = Shit.page(params[:page]).per(6)
	end

end
