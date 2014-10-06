class Comic < ActiveRecord::Base
  has_many :pages, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :creators, presence: true, length: { maximum: 255 }
end
