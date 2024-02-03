# frozen_string_literal: true
class Battle < ApplicationRecord
  # To do remove useless character1 character2
  belongs_to :character1, class_name: 'Character'
  belongs_to :character2, class_name: 'Character'
  belongs_to :winner, class_name: 'Character'
  belongs_to :loser, class_name: 'Character'
  has_many :actions, -> { order(:created_at) }, dependent: :destroy

  validates :character1_id, presence: true
  validates :character2_id, presence: true
  validate :characters_must_be_different
  validate :winner_and_loser_must_be_participants

  private

  def characters_must_be_different
    errors.add(:character2_id, 'cannot be the same as character1') unless character1_id != character2_id
  end

  def winner_and_loser_must_be_participants
    errors.add(:base, 'Winner and loser must be participants of the battle') unless [winner_id, loser_id].include?(character1_id) &&
                                                                                [winner_id, loser_id].include?(character2_id)
  end
end
