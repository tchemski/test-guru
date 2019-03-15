class Category < ApplicationRecord
  has_many :tests, dependent: :destroy
  has_many :categories_users
  has_many :users, through: :categories_users

  default_scope { order(:title) }
end
