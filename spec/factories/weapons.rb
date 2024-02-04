FactoryBot.define do
  factory :weapon do
    name { Faker::Games::ElderScrolls.weapon }
    attack_bonus { Faker::Number.between(from: 0, to: 30) }
  end
end
