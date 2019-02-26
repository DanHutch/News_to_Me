class FavoritesController < ApplicationController

  def index
    @facade = FeedFacade.new(Favorite.all.order('created_at DESC'))
    # @favorites = Favorite.all.order('created_at DESC')
  end

  def create
    favorite = Favorite.new(fav_params)
    attempt_save_fav(favorite)
  end

private

  def attempt_save_fav(fav)
    unless fav.save
      flash[:error] = "Something went wrong"
      redirect_to root_path
    end
  end

  def fav_params
    params.require(:favorite).permit(:author, :date, :description, :img_url, :publication, :title, :url)
  end

end