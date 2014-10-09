class AddCoverImageToComics < ActiveRecord::Migration
  def change
    add_column :comics, :cover_image, :string
  end
end
