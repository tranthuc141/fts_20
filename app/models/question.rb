class Question < ActiveRecord::Base
  has_many :answers
  has_many :options, dependent: :destroy
  belongs_to :course

  accepts_nested_attributes_for :options

  validates :content, presence: true

  scope :choice_question, -> {where type_question: 'choice_question'}

  def is_choice_question?
    self.type_question == "choice_question"
  end

end
