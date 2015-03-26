class Question < ActiveRecord::Base
  has_many :answers
  has_many :options, dependent: :destroy
  belongs_to :course

  accepts_nested_attributes_for :options

  validates :content, presence: true
end
