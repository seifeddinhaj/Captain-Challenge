class AddEquipmentToCharacter < ActiveRecord::Migration[7.0]
  def change
    add_reference :characters, :weapon, null: true, foreign_key: true
    add_reference :characters, :shield, null: true, foreign_key: true
  end
end
