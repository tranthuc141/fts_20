class Question < ActiveRecord::Base
  has_many :answers
  has_many :options, dependent: :destroy
  belongs_to :course
end
