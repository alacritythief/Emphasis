class AddNullFalseToChapterNumber < ActiveRecord::Migration
  def change
    change_column_null :pages, :chapter, false
  end
end
