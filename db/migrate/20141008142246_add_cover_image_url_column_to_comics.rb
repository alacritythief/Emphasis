class AddCoverImageUrlColumnToComics < ActiveRecord::Migration
  def change
    add_column :comics, :cover_img_url, :string, default: "http://placehold.it/200x250/b0b0b0/ffffff/&text=emphasis"
  end
end
