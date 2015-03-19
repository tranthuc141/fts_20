class User < ActiveRecord::Base
  has_many :results
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :normal, -> {where role: 'normal'}

  def is_admin?
    self.role == 'admin'
  end
end
