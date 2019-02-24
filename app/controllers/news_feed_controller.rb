class NewsFeedController < ApplicationController

  def index
    @news = NewsApiService.get_news('bitcoin')
  end

end