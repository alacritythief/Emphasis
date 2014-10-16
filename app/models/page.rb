class Page < ActiveRecord::Base
  belongs_to :comic
  belongs_to :user
  has_many :elements

  validates :chapter, numericality: { greater_than_or_equal_to: 1 }, presence: true, uniqueness: { scope: [ :comic_id, :number ]  }
  validates :number, numericality: { greater_than_or_equal_to: 1 }, presence: true, uniqueness: { scope: :comic_id  }
  validates :page_type, presence: true, length: { maximum: 10 }

  def self.authorized_find(user, id)
    if user.admin?
      find(id)
    else
      where(user: user).find(id)
    end
  end

  def editable_by?(user)
    self.user == user || user.admin?
  end
end
