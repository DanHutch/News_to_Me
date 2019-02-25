require 'rails_helper'

describe 'Visitor' do
  describe 'on the favorites page' do

    it 'should show a message if there are no favorites' do
      VCR.use_cassette("newsapi_service_spec") do
        visit favs_path
        expect(page).to have_css('.favs-main')
        expect(page).to have_css('.empty-favs')
        expect(page).to_not have_css('.story-card')
        expect(page).to have_content("You do not currently have any favorited articles.")
      end
    end

    it 'can see a list of favorited articles' do
      VCR.use_cassette("newsapi_service_spec") do
        fav_1 = Favorite.create(title: "Fake Favorite 1", author: "Fake Author 1", publication: "Fake Publication 1", date: "Fake Date 1", url: "www.fakeurl1.com", img_url: "https://images-na.ssl-images-amazon.com/images/I/51zLZbEVSTL._SX425_.jpg", description: "Fake description 1. This is the number 1 fake article.")

        fav_2 = Favorite.create(title: "Fake Favorite 2", author: "Fake Author 2", publication: "Fake Publication 2", date: "Fake Date 2", url: "www.fakeurl2.com", img_url: "https://images-na.ssl-images-amazon.com/images/I/51zLZbEVSTL._SX425_.jpg", description: "Fake description 2. This is the number 2 fake article.")

        fav_3 = Favorite.create(title: "Fake Favorite 3", author: "Fake Author 3", publication: "Fake Publication 3", date: "Fake Date 3", url: "www.fakeurl3.com", img_url: "https://images-na.ssl-images-amazon.com/images/I/51zLZbEVSTL._SX425_.jpg", description: "Fake description 3. This is the number 3 fake article.")

        fav_4 = Favorite.create(title: "Fake Favorite 4", author: "Fake Author 4", publication: "Fake Publication 4", date: "Fake Date 4", url: "www.fakeurl4.com", img_url: "https://images-na.ssl-images-amazon.com/images/I/51zLZbEVSTL._SX425_.jpg", description: "Fake description 4. This is the number 4 fake article.")

        visit favs_path

        expect(page).to have_css('.favs-main')
        expect(page).to have_css('.story-card', count: 4)

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
  end
end