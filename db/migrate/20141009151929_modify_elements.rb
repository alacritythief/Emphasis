class ModifyElements < ActiveRecord::Migration
  def up
    change_column :elements, :image_url, :string, null: true, default: nil
    add_column :elements, :image_file, :string
  end

  def down
    change_column :elements, :image_url, :string, null: false, default: "http://placehold.it/700x950/b0b0b0/ffffff/&text=emphasis"
    remove_column :elements, :image_file, :string
  end
end
