class Exam < ActiveRecord::Base
  has_one :result
  belongs_to :user
  belongs_to :course
  
  scope :checked_exams, -> {where status: 'checked'}
  scope :not_check_yet, -> {where status: 'not_check_yet'}
  scope :warning, -> {where 'created_at > ?', 2.days.ago}
  scope :expired, -> {where 'created_at < ?', 2.days.ago}

  validates :course_id, presence: true

  def time_out?
    created_at < self.course.time_limit.minutes.ago
  end

  def timeout
    created_at + self.course.time_limit.minutes
  end

  def time_left
    timeout - Time.zone.now
  end
end
