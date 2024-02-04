FactoryBot.define do
  factory :character do
    name { Faker::Games::Witcher.character }
    life_points { Faker::Number.between(from: 10, to: 100) }
    attack_points { Faker::Number.between(from: 1, to: 10) }
  end
end
