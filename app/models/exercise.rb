class Exercise < ApplicationRecord
  SIMPLE_FORM_ATTRIBUTES = [:name].freeze

  belongs_to :training
  has_many :exercise_sets

  validates :name, length: {minimum: 3}
end
