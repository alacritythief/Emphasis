class AddPlaceholderImageToElements < ActiveRecord::Migration
  def up
    change_column :elements, :image_url, :string, null: false, default: "http://placehold.it/700x950/b0b0b0/ffffff/&text=emphasis"
  end

  def down
    change_column :elements, :image_url, :string, null: false
  end
end
