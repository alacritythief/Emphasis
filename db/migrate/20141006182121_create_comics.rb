class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :name, null: false
      t.text :description
      t.text :creators, null: false

      t.timestamps
    end
  end
end
