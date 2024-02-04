FactoryBot.define do
  factory :shield do
    name { Faker::Games::ClashOfClans.defensive_building }
    defense_bonus { Faker::Number.between(from: 0, to: 30) }
  end
end
