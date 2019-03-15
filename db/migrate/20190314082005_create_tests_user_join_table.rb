class CreateTestsUserJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :tests, :users do |t|
      # t.index [:test_id, :user_id]
      t.index [:user_id, :test_id], unique: true
      t.boolean :passed, default: false
    end
  end
end
