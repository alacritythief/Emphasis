class AddUserIdToComicsPagesElements < ActiveRecord::Migration
  def change
    add_column :comics, :user_id, :integer, null: false
    add_column :pages, :user_id, :integer, null: false
    add_column :elements, :user_id, :integer, null: false
  end
end
