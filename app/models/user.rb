class User < ApplicationRecord
  has_many :tests_passages
  has_many :tests, through: :tests_passages
  has_many :own_tests, class_name: 'Test', inverse_of: 'author'

  def tests_passage(test)
    tests_passages.where(test_id: test.id).order(:id).last
  end

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
end
