require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe "validations" do
    it {should validate_presence_of(:date)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:url)}
    it {should validate_presence_of(:title)}
    it {should validate_uniqueness_of(:url)}
  end

  describe "class methods" do
    describe ".exists?" do

      it "should return false if no favorite exists with the given url" do
        expect(Favorite.exists?('www.fakeurl.com')).to eq(false)
      end

      it "should return true if a favorite exists with the given url" do
        fav = Favorite.create(date: "fakedate", description: 'this is a fake article',
          url: 'www.fakeurl.com', title: "Fake Article Title")
        expect(Favorite.exists?(fav.url)).to eq(true)
      end

    end
  end
end
