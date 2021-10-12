class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :code, index: true, unique: true
      t.integer :ideal_quantity
      t.integer :current_quantity
      t.string :name
      t.references :user, foreign_key: true, index: true, unique: true

      t.timestamps
    end
  end
end
