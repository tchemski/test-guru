class CreateCategoriesUserJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :users do |t|
      # t.index [:category_id, :user_id]
      t.index [:user_id, :category_id], unique: true
      t.float :progress, default: 0
    end
  end
end
