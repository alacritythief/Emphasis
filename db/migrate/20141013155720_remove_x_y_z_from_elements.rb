class RemoveXYZFromElements < ActiveRecord::Migration
  def up
    remove_column :elements, :x, :integer
    remove_column :elements, :y, :integer
    remove_column :elements, :z, :integer
  end

  def down
    add_column :elements, :x, :integer
    add_column :elements, :y, :integer
    add_column :elements, :z, :integer
  end
end
