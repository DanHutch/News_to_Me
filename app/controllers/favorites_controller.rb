class FavoritesController < ApplicationController

  def create
    favorite = Favorite.new(fav_params)
    attempt_save_fav(favorite)
  end

private

  def attempt_save_fav(fav)
    if fav.save
      flash[:success] = "Article Added to Favorites!"
      redirect_to root_path
    end
  end

  def fav_params
    params.require(:favorite).permit(:author, :date, :description, :img_url, :publication, :title, :url)
  end

end