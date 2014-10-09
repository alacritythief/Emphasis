class RemoveDefaultFromCoverImgUrl < ActiveRecord::Migration
  def up
    change_column :comics, :cover_img_url, :string, null: true, default: nil
  end

  def down
    change_column :comics, :cover_img_url, :string, null: false, default: "http://placehold.it/200x250/b0b0b0/ffffff/&text=emphasis"
  end
end
