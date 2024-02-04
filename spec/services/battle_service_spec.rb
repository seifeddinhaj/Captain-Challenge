require 'rails_helper'

RSpec.describe BattleService do

  let(:character1) { create(:character) }
  let(:character2) { create(:character) }
  let(:battle) { create(:battle, character1: character1, character2: character2) }

  before do
    # Assurer que character1 et character2 sont différents si votre factory ne le garantit pas
    character2.update(life_points: 50) unless character1.id != character2.id

    # Simuler des méthodes si nécessaire, ou laisser les objets réagir naturellement
    allow(character1).to receive(:receive_damage).and_call_original
    allow(character2).to receive(:receive_damage).and_call_original
    allow(character1).to receive(:increment!).and_call_original
    allow(character2).to receive(:increment!).and_call_original
    allow(battle.actions).to receive(:build)

    @battle_service = described_class.new(character1, character2, battle)
  end

  describe '#fight' do
    it 'performs the battle until one character is defeated' do
      expect(character1).to receive(:receive_damage).at_least(:once)
      expect(character2).to receive(:receive_damage).at_least(:once)

      @battle_service.fight
    end

    it 'logs the initial state' do
      expect(battle.actions).to receive(:build).with(hash_including(description: /État initial/))

      @battle_service.fight
    end

    it 'concludes the battle with a winner and loser' do
      allow(character1).to receive(:life_points).and_return(10, 0) # Character1 is defeated in the second check
      allow(character2).to receive(:life_points).and_return(50) # Character2 wins

      expect(battle.actions).to receive(:build).with(hash_including(description: "Le gagnant est #{character2.name}"))
      expect(character1).to receive(:increment!).with(:experience, 1)
      expect(character2).to receive(:increment!).with(:experience, 3)

      winner, loser = @battle_service.fight
      expect(winner).to eq(character2)
      expect(loser).to eq(character1)
    end
  end
end
