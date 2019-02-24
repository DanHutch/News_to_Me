require 'rails_helper'

describe NewsApiService do

  it "exists" do
    VCR.use_cassette("newsapi_service_spec") do
      service = NewsApiService.get_news('bitcoin')
      expect(service).to be_a(NewsApiService)
    end
  end


end