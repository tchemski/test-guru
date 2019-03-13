class CreateTestsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :tests_users do |t|
      t.index [:test_id, :user_id]
      t.references :user
      t.references :test
      t.boolean :passed, default: false
    end
  end
end
