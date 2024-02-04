require 'rails_helper'

RSpec.describe Character, type: :model do
  # Test de validité avec des attributs valides
  it 'is valid with valid attributes' do
    character = build(:character)
    expect(character).to be_valid
  end

  # Tests pour les validations
  describe 'validations' do
    it 'is not valid with life_points less than 10' do
      character = build(:character, life_points: 9)
      expect(character).not_to be_valid
    end

    it 'is not valid with attack_points greater than 10' do
      character = build(:character, attack_points: 11)
      expect(character).not_to be_valid
    end
  end

  # Test pour le callback check_experience
  describe '#check_experience' do
    it 'increments level by 1 if experience is 20 or more' do
      character = create(:character, experience: 20, level: 1)
      character.save
      expect(character.level).to eq(2)
    end
  end

  # Test pour total_attack_points
  describe '#total_attack_points' do
    it 'calculates the total attack points correctly' do
      weapon = create(:weapon, attack_bonus: 10) # Supposons un bonus d'attaque de 10%
      character = create(:character, attack_points: 10, level: 1, weapon: weapon)
      expect(character.total_attack_points).to eq(11) # (10 * (1 + 0.1) + (1 * 0.25)).round
    end
  end

  # Test pour damage_reduction
  describe '#damage_reduction' do
    it 'calculates damage reduction correctly' do
      shield = create(:shield, defense_bonus: 20) # Supposons un bonus de défense de 20%
      character = create(:character, shield: shield)
      expect(character.damage_reduction).to eq(0.2)
    end
  end

  # Test pour receive_damage
  describe '#receive_damage' do
    it 'reduces life_points correctly after receiving damage' do
      character = create(:character, life_points: 100)
      character.receive_damage(50) # Supposons 50 de dégâts
      expect(character.life_points).to be < 100
    end
  end
end
