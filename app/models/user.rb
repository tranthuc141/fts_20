class User < ActiveRecord::Base
  has_many :results
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  scope :normal, -> {where role: 'normal'}

  def is_admin?
    self.role == 'admin'
  end
end
