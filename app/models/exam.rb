class Exam < ActiveRecord::Base
  has_one :result
  belongs_to :user
  belongs_to :course
  scope :ready_exams, -> {where status: 'not_check_yet'}
  scope :checked_exams, -> {where status: 'checked'}
  scope :not_check_yet, -> {where status: 'not_check_yet'}

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
