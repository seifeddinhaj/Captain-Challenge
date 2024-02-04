# frozen_string_literal: true
class Battle < ApplicationRecord
  # To do remove useless character1 character2
  belongs_to :character1, class_name: 'Character'
  belongs_to :character2, class_name: 'Character'
  belongs_to :winner, class_name: 'Character', optional: true
  belongs_to :loser, class_name: 'Character', optional: true
  has_many :actions, -> { order(:created_at) }, dependent: :destroy

  validate :characters_must_be_different

  private

  def characters_must_be_different
    errors.add(:character2_id, 'cannot be the same as character1') unless character1_id != character2_id
  end
end
