class User < ActiveRecord::Base
  has_many :exams
  
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :normal, -> {where role: 'normal'}

  def slug
    name.to_s.downcase.gsub(" ", "-")  
  end

  def to_param
    "#{id}-#{slug}"
  end

  def is_admin?
    self.role == 'admin'
  end

  def search_with_course course_name, checked
    if checked == 1
      self.exams.not_check_yet.joins(:course).merge Course.search_by_name course_name
    elsif checked == 2
      self.exams.checked_exams.joins(:course).merge Course.search_by_name course_name
    else
      self.exams.joins(:course).merge Course.search_by_name course_name
    end
  end
end
