class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :categories_users
  has_many :categories, through: :categories_users
  def tests_by_level(test_level)
    tests.where(level: test_level)
  end
end
