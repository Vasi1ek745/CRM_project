class MainPageController < ApplicationController

	def index
		@clients = Client.all
	end
	def about
	end
end
