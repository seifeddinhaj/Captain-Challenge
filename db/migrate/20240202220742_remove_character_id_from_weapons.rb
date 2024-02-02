class RemoveCharacterIdFromWeapons < ActiveRecord::Migration[7.0]
  def change
    remove_column :weapons, :character_id, :bigint
    remove_column :shields, :character_id, :bigint
  end
end
