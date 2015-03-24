class Course < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :text_questions, dependent: :destroy
  has_many :results
end
