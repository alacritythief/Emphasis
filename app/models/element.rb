class Element < ActiveRecord::Base
  belongs_to :page
  belongs_to :user

  validates :animation_type, presence: true
  validate :url_or_upload

  mount_uploader :image_file, ElementImageUploader

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

  def url_or_upload
    if image_url.blank? && image_file.blank?
      errors[:base] << "Please enter either a url or upload a file."
    end

    if image_url.present? && image_file.present?
      errors[:base] << "Choose either a url or file for your element image."
    end
  end
end
