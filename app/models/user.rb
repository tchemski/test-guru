class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :own_tests, class_name: 'Test', inverse_of: 'author'
  def tests_by_level(test_level)
    tests.where(level: test_level)
  end

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
end
