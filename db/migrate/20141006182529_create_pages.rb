class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :chapter
      t.integer :name
      t.integer :number, null: false
      t.string :type, null: false, default: 'page'
    end
  end
end
