class TextQuestion < ActiveRecord::Base
  has_many :answers
  belongs_to :course
end
