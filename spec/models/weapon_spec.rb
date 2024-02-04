require 'rails_helper'

RSpec.describe Weapon, type: :model do
  # Test de validité avec des attributs valides
  it 'is valid with valid attributes' do
    weapon = build(:weapon)
    expect(weapon).to be_valid
  end

  # Tests pour la validation de attack_bonus
  describe 'validations' do
    it 'is valid with an attack_bonus between 0 and 30' do
      weapon = build(:weapon, attack_bonus: 15)
      expect(weapon).to be_valid
    end

    it 'is not valid with an attack_bonus less than 0' do
      weapon = build(:weapon, attack_bonus: -1)
      weapon.valid?
      expect(weapon.errors[:attack_bonus]).to include('must be greater than or equal to 0')
    end

    it 'is not valid with an attack_bonus greater than 30' do
      weapon = build(:weapon, attack_bonus: 31)
      weapon.valid?
      expect(weapon.errors[:attack_bonus]).to include('must be less than or equal to 30')
    end
  end
end
