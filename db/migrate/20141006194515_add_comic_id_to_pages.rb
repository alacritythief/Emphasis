class AddComicIdToPages < ActiveRecord::Migration
  def change
    add_column :pages, :comic_id, :integer
  end
end
