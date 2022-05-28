class Training < ApplicationRecord
  SIMPLE_FORM_ATTRIBUTES = [:name].freeze

  has_many :exercises

  validates :name, length: {minimum: 3}
end
