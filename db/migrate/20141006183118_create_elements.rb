class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.string :image_url, null: false
      t.string :alt_text
      t.text :notes
      t.integer :x
      t.integer :y
      t.integer :z
      t.string :animation_type, null: false, default: "none"
    end
  end
end
