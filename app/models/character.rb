class Character < ApplicationRecord
  has_one_attached :avatar
  belongs_to :shield, optional: true
  belongs_to :weapon, optional: true
end
