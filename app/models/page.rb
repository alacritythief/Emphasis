class Page < ActiveRecord::Base
  belongs_to :comic
  has_many :elements

  validates :number, presence: true
  validates :type, presence: true, length: { maximum: 10 }
end
