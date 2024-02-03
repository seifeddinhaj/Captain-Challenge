class AddExperienceAndLevelToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :experience, :integer, default: 0
    add_column :characters, :level, :integer, default: 1
  end
end
