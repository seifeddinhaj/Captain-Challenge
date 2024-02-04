require 'rails_helper'

RSpec.describe Battle, type: :model do
  describe 'associations' do
    it { should belong_to(:character1).class_name('Character') }
    it { should belong_to(:character2).class_name('Character') }
    it { should belong_to(:winner).class_name('Character').optional }
    it { should belong_to(:loser).class_name('Character').optional }
    it { should have_many(:actions).dependent(:destroy) }
  end

  describe 'validations' do
    it 'is valid with different characters' do
      battle = build(:battle)
      expect(battle).to be_valid
    end

    it 'is not valid if character1 and character2 are the same' do
      @character = create(:character)
      battle = build(:battle, character1: @character, character2: @character)
      battle.valid?
      expect(battle.errors[:character2_id]).to include('cannot be the same as character1')
    end
  end
end
