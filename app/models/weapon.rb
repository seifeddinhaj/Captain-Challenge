# frozen_string_literal: true
class Weapon < ApplicationRecord
  has_many :characters
  validates :attack_bonus, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 30 }
end
