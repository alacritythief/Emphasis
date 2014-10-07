class Page < ActiveRecord::Base
  belongs_to :comic
  has_many :elements

  validates :number, numericality: { greater_than_or_equal_to: 0 }, presence: true, uniqueness: { scope: :comic_id }
  validates :page_type, presence: true, length: { maximum: 10 }
end
