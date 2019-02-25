Rails.application.routes.draw do

  root "news_feed#index"

  post "/favorites", to: "favorites#create", as: "add_fav"

  get "/favorites", to: "favorites#index", as: "favs"
end
