# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb

# Création de personnages
4.times do
  character = Character.create!(
    name: Faker::Games::Witcher.character,
    life_points: Faker::Number.between(from: 10, to: 100),
    attack_points: Faker::Number.between(from: 1, to: 10)
  )
  avatar_url = Faker::Avatar.image(slug: character.name.parameterize, size: '100x100', format: 'jpg')
  avatar_file = URI.open(avatar_url)
  character.avatar.attach(io: avatar_file, filename: "#{character.name.parameterize}-avatar.jpg", content_type: 'image/jpeg')
end

# Création d'armes
4.times do
  Weapon.create!(
    name: Faker::Games::ElderScrolls.weapon ,
    attack_bonus: Faker::Number.between(from: 0, to: 30)
  )
end

# Création de boucliers
4.times do
  Shield.create!(
    name: Faker::Games::ClashOfClans.defensive_building,
    defense_bonus: Faker::Number.between(from: 0, to: 30)
  )
end

puts 'Database populated with characters, weapons, and shields!'
