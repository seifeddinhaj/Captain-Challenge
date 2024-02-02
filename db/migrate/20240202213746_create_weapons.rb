class CreateWeapons < ActiveRecord::Migration[7.0]
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :attack_bonus
      t.references :character, null: true, foreign_key: true

      t.timestamps
    end
  end
end
