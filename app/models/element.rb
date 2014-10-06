class Element < ActiveRecord::Base
  belongs_to :page

  validates :image_url, :animation_type, presence: true
end
