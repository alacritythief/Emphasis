class AddIndexOnComicIdToPages < ActiveRecord::Migration
  def change
    add_index :pages, :comic_id
  end
end
