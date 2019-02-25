require 'rails_helper'

describe 'Visitor' do
  describe 'on the root / newsfeed page' do
    it 'can see a feed of articles' do
      VCR.use_cassette("newsapi_service_spec") do

        visit root_path
        expect(page).to have_css('.news-feed-main')
        expect(page).to have_css('.story-card', count: 20)

        within(first('.story-card')) do
          expect(page).to have_css('.story-img')
          expect(page).to have_css('.story-title')
          expect(page).to have_link(count: 1)
          expect(page).to have_css('.by-line')
          expect(page).to have_css('.publication')
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

    it 'should see a button, for each article, to add as favorite, which disappears after the article has been favorited' do
      VCR.use_cassette("newsapi_service_spec") do
        expect(Favorite.count).to eq(0)

        visit root_path

        within(first('.story-card')) do
          VCR.use_cassette("newsapi_service_spec_2") do
            expect(page).to have_button("Add to Favorites")
            click_on("Add to Favorites")
          end
        end

        expect(current_path).to eq(root_path)
        expect(page).to have_content("Article Added to Favorites!")
        within(first('.story-card')) do
          expect(page).to_not have_button("Add to Favorites")
        end
        expect(Favorite.count).to eq(1)
        expect(Favorite.first).to be_a(Favorite)
      end
    end
  end
end
