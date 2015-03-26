class Course < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :results

  validates :name, presence: true
  validates :time_limit, presence: true
end
