class AddIdNameToElements < ActiveRecord::Migration
  def change
    add_column :elements, :id_name, :string
  end
end
