class Comic < ActiveRecord::Base
  has_many :pages, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, length: { maximum: 255 }
  validates :creators, presence: true, length: { maximum: 255 }

  def chapter_pages
    self.pages.order(chapter: :asc, number: :asc)
  end

  def chapters
    self.pages.pluck(:chapter).uniq.sort
  end

  def self.authorized_find(user, id)
    if user.admin?
      find(id)
    else
      where(user: user).find(id)
    end
  end
end
