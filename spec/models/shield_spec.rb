require 'rails_helper'

RSpec.describe Shield, type: :model do
  # Test de validité avec des attributs valides
  it 'is valid with valid attributes' do
    shield = build(:shield)
    expect(shield).to be_valid
  end

  # Tests pour les validations de defense_bonus
  describe 'validations' do
    it 'is valid with a defense_bonus between 0 and 30' do
      shield = build(:shield, defense_bonus: 15)
      expect(shield).to be_valid
    end

    it 'is not valid with a defense_bonus less than 0' do
      shield = build(:shield, defense_bonus: -1)
      shield.valid?
      expect(shield.errors[:defense_bonus]).to include('must be greater than or equal to 0')
    end

    it 'is not valid with a defense_bonus greater than 30' do
      shield = build(:shield, defense_bonus: 31)
      shield.valid?
      expect(shield.errors[:defense_bonus]).to include('must be less than or equal to 30')
    end
  end

  # Ajouter des tests supplémentaires si nécessaire
end
