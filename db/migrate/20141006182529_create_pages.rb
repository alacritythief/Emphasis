class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :chapter
      t.integer :name
      t.integer :number, null: false
      t.boolean :is_chapter, null: false, default: false
    end
  end
end
