class AddAdvancedCssJsToElements < ActiveRecord::Migration
  def change
    add_column :elements, :css, :text
    add_column :elements, :js, :text
  end
end
