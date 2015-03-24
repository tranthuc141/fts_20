class Answer < ActiveRecord::Base
  belongs_to :result
  belongs_to :option
  belongs_to :question

  delegate :correct, to: :option
end
