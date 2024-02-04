FactoryBot.define do
  factory :battle do
    character1 { create(:character) }
    character2 { create(:character) }
    winner { character1 }
    loser { character2 }

    # Assurez-vous que character1 et character2 sont différents
    after(:create) do |battle|
      loop do
        battle.character2 = create(:character)
        break if battle.character1_id != battle.character2_id
      end
    end
  end
end
