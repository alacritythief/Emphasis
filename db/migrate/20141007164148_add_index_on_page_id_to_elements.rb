class AddIndexOnPageIdToElements < ActiveRecord::Migration
  def change
    add_index :elements, :page_id
  end
end
