class ExerciseSet < ApplicationRecord
  DATE_FORMAT = '%0d/%0m/%Y'.freeze
  SIMPLE_FORM_ATTRIBUTES = [:value, :repetitions].freeze

  belongs_to :exercise

  validates :value, numericality: { greater_than_or_equal_to: 0 }
  validates :repetitions, numericality: { greater_than_or_equal_to: 1 }

  def perform_date
    created_at.strftime(DATE_FORMAT)
  end
end
