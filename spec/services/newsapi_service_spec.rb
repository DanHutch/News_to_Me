require 'rails_helper'

describe NewsApiService do

  context "class methods" do

    context ".get_news" do
      it "returns a user's data" do
        VCR.use_cassette("newsapi_service_spec") do
          news = NewsApiService.get_news('bitcoin')
          expect(news).to be_a(Array)
          expect(news.length).to eq(20)
          news.each do |story|
            expect(story).to respond_to(:name)
            expect(story).to respond_to(:author)
            expect(story).to respond_to(:title)
            expect(story).to respond_to(:description)
            expect(story).to respond_to(:url)
            expect(story).to respond_to(:urlToImage)
            expect(story).to respond_to(:publishedAt)
          end
        end
      end
    end

  end

end