class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, index: true, unique: true
      t.string :password_digest
      t.string :username, unique: true

      t.timestamps
    end
  end
end
