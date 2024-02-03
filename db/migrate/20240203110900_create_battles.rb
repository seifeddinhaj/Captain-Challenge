class CreateBattles < ActiveRecord::Migration[7.0]
  def change
    create_table :battles do |t|
      t.integer :character1_id
      t.integer :character2_id
      t.integer :winner_id
      t.integer :loser_id

      t.timestamps
    end
  end
end
