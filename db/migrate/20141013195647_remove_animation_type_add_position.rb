class RemoveAnimationTypeAddPosition < ActiveRecord::Migration
  def up
    add_column :elements, :position, :string, default: "none", null: false
    remove_column :elements, :animation_type, :string, default: "none", null: false
  end

  def down
    remove_column :elements, :position, :string, default: "none", null: false
    add_column :elements, :animation_type, :string, default: "none", null: false
  end
end
