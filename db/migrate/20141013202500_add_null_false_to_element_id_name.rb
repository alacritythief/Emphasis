class AddNullFalseToElementIdName < ActiveRecord::Migration
  def up
    change_column_null :elements, :id_name, false
  end

  def down
    change_column_null :elements, :id_name, true
  end
end
