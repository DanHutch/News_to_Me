require 'rails_helper'

RSpec.describe "POST /favorites" do

  it "should not save a favorite if a favorite exists with the given url" do
    expect(Favorite.count).to eq(0)

    fav = Favorite.create(date: "2019-02-15T14:53:40Z", description: 'this is a fake article',
      url: 'www.fakeurl.com', title: "Fake Article Title")

    expect(Favorite.count).to eq(1)

    post '/favorites', params: {favorite: {title: "second title", author: "some new author", publication: "does not matter", date: "2019-02-25T19:54:16Z", url: 'www.fakeurl.com', img_url: "fakeURLagain", description: "lalalalala"}}

    expect(Favorite.count).to eq(1)
  end

end