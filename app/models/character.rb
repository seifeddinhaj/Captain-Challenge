# frozen_string_literal: true
class Character < ApplicationRecord
  has_one_attached :avatar
  belongs_to :shield, optional: true
  belongs_to :weapon, optional: true

  # Validations
  # Assurez-vous que life_points est un nombre entre 10 et 100
  validates :life_points, numericality: { greater_than_or_equal_to: 10, less_than_or_equal_to: 100 }
  # Assurez-vous que attack_points est un nombre entre 1 et 10
  validates :attack_points, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }

  def total_attack_points
    (attack_points * (1 + (weapon&.attack_bonus.to_f || 0) / 100)).round
  end

  def damage_reduction
    shield_bonus = shield&.defense_bonus.to_f || 0
    (shield_bonus / 100)
  end

  def receive_damage(damage)
    reduction = damage_reduction
    reduced_damage = damage * (1 - reduction)
    self.life_points -= reduced_damage.round
  end

end
