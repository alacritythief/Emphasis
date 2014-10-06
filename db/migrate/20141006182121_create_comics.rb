class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :name, null: false
      t.string :creators, null: false
      t.text :description

      t.timestamps
    end
  end
end
