class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :life_points
      t.integer :attack_points

      t.timestamps
    end
  end
end
