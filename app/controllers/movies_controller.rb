class MoviesController < ApplicationController

  def index
    @movies = Movie.all.where("title LIKE ?", "%#{params[:query]}%")
  end

end

