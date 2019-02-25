class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :title
      t.string :author
      t.string :publication
      t.string :date
      t.string :url
      t.string :img_url
      t.text :description

      t.timestamps
    end
  end
end
