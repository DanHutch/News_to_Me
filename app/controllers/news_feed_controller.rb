class NewsFeedController < ApplicationController

  def index
    @facade = FeedFacade.new(NewsApiService.get_news('bitcoin'))
  end

end