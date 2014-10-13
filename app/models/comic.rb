class Comic < ActiveRecord::Base
  has_many :pages, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, length: { maximum: 255 }
  validates :creators, presence: true, length: { maximum: 255 }

  mount_uploader :cover_image, CoverImageUploader
  validate :url_or_upload

  def chapter_pages
    self.pages.order(chapter: :asc, number: :asc)
  end

  def chapters
    self.pages.pluck(:chapter).uniq.sort
  end

  def editable_by?(user)
    self.user == user || user.admin?
  end

  def self.authorized_find(user, id)
    if user.admin?
      find(id)
    else
      where(user: user).find(id)
    end
  end

  def url_or_upload
    if cover_img_url.blank? && cover_image.blank?
      errors[:base] << "Please enter either a url or upload a file."
    end

    if cover_img_url.present? && cover_image.present?
      errors[:base] << "Choose either a url or file for your cover image."
    end
  end
end
