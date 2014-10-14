class AddZIndexBackToElements < ActiveRecord::Migration
  def change
    add_column :elements, :z, :integer
  end
end
