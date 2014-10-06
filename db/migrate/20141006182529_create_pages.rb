class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :chapter
      t.string :name
      t.integer :number, null: false
      t.string :page_type, null: false, default: "page"

      t.timestamps
    end
  end
end
