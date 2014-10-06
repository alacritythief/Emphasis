class AddPageIdToElements < ActiveRecord::Migration
  def change
    add_column :elements, :page_id, :integer, null: false
  end
end
