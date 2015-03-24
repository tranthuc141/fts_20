class Result < ActiveRecord::Base
  after_create :update_status_exam

  belongs_to :exam
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers

  def score
    answers = self.answers
    answers.select{|answer| answer.correct}.count
  end

  def update_status_exam
    self.exam.update_attributes status: 'checked'
  end
end
