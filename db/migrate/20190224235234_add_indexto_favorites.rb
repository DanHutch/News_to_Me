class AddIndextoFavorites < ActiveRecord::Migration[5.2]
  def change
    add_index :favorites, :url
  end
end
