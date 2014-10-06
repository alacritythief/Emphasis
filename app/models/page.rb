class Page < ActiveRecord::Base
  belongs_to :comic
  has_many :elements

  validates :number, presence: true
  validates :page_type, presence: true, length: { maximum: 10 }
end
