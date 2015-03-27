class Exam < ActiveRecord::Base
  has_one :result
  belongs_to :user
  belongs_to :course

  scope :ready_exams, -> {where status: 'not_check_yet'}
  scope :checked_exams, -> {where status: 'checked'}
  scope :not_check_yet, -> {where status: 'not_check_yet'}
end
