require 'rails_helper'

describe 'Visitor' do
  describe 'on the root / newsfeed page' do
    it 'can see a list of tutorials' do
      VCR.use_cassette("newsapi_service_spec") do

        visit root_path
        expect(page).to have_css('.news-feed-main')
        expect(page).to have_css('.story-card', count: 20)

        within(first('.story-card')) do
          expect(page).to have_css('.story-img')
          expect(page).to have_css('.story-title')
          expect(page).to have_link(count: 1)
          expect(page).to have_css('.by-line')
          expect(page).to have_css('.published-at')
          expect(page).to have_css('.description')
        end
      end
    end

    it 'can see the attribution footer' do
      VCR.use_cassette("newsapi_service_spec") do
        visit root_path

        expect(page).to have_css('.main-footer')

        within('.main-footer') do
          expect(page).to have_css('.attribution')
          expect(page).to have_content('Powered By NewsAPI.org')
          expect(page).to have_link('NewsAPI.org')
        end
      end
    end
  end
end
