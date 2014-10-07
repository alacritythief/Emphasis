class Element < ActiveRecord::Base
  belongs_to :page
  belongs_to :user

  validates :image_url, :animation_type, presence: true

  def self.authorized_find(user, id)
    if user.admin?
      find(id)
    else
      where(user: user).find(id)
    end
  end
end
