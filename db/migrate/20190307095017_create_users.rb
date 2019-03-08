class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, limit: 50
      t.string :email, limit: 50
      t.string :password, null: false
      t.integer :level, default: 0

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
