require 'news-api'

class NewsApiService

  def self.get_news(topic)
    news = News.new(ENV["NEWS_KEY"])
    results = news.get_everything(q: topic,
      language: 'en')
  end

end