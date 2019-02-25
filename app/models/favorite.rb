class Favorite < ApplicationRecord

  validates_presence_of :date,
                        :description,
                        :url,
                        :title

  validates_uniqueness_of :url

  def self.exists?(url_in)
    Favorite.find_by(url: url_in) ? true :false
  end

end
