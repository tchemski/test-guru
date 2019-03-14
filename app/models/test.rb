class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  def self.titles_by_category_title(category_title)
    self.joins(:category)
        .where('categories.title = ?', category_title)
        .order(title: :desc)
        .pluck(:title)
  end
end
