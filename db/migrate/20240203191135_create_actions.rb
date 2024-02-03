class CreateActions < ActiveRecord::Migration[7.0]
  def change
    create_table :actions do |t|
      t.string :description
      t.references :battle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
