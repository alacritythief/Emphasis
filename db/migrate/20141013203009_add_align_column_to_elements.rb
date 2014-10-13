class AddAlignColumnToElements < ActiveRecord::Migration
  def change
    add_column :elements, :align, :string, default: "default", null: false
  end
end
