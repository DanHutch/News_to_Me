class FeedFacade

  def initialize(stories)
    @stories = stories
  end

  def stories
    @stories
  end

  def format_date(date_in)

    date_in.to_datetime.strftime("%m/%d/%Y")
  end

  def favorite?(url)
    Favorite.exists?(url)
  end

  def empty?
    @stories.length < 1
  end

end