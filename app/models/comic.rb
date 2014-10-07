class Comic < ActiveRecord::Base
  has_many :pages, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :creators, presence: true, length: { maximum: 255 }

  def chapter_pages(number)
    self.pages.where(chapter: number).order(number: :asc)
  end

  def chapters
    self.pages.pluck(:chapter).uniq.sort
  end
end
