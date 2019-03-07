class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, limit: 50
      t.string :email, limit: 60
      t.string :password
      t.integer :level

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
