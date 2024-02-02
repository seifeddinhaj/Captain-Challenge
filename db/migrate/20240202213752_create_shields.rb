class CreateShields < ActiveRecord::Migration[7.0]
  def change
    create_table :shields do |t|
      t.string :name
      t.integer :defense_bonus
      t.references :character, null: true, foreign_key: true

      t.timestamps
    end
  end
end
