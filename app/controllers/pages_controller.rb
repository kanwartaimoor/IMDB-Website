class PagesController < ApplicationController
	def index
		@movies = Movie.all
		@action = Movie.where(genre: "Action")
		@thriller = Movie.where(genre: "Thriller")
		@comedy = Movie.where(genre: "Comedy")
	end
end
