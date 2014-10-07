class User < ActiveRecord::Base
  has_many :comics, dependent: :destroy
  has_many :pages, dependent: :destroy
  has_many :elements, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: {maximum: 16}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  def editable_by?(user)
    self == user
  end

  def admin?
    role == 'admin'
  end
end
