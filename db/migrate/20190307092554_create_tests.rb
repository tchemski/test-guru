class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 0
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true
      t.index [:title, :level],
              unique: true,
              name: 'index_tests_title_and_level'

      t.timestamps
    end
  end
end
