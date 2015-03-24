class Answer < ActiveRecord::Base
  belongs_to :result
  belongs_to :option
  belongs_to :question
  belongs_to :text_question

  delegate :correct, to: :option, allow_nil: true
end
