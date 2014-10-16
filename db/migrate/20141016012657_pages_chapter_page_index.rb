class PagesChapterPageIndex < ActiveRecord::Migration
  def change
    add_index :pages, [:chapter, :number]
  end
end
