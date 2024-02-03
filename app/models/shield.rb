# frozen_string_literal: true
class Shield < ApplicationRecord
  has_many :characters
  validates :defense_bonus, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 30 }
end
