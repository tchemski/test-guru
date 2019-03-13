class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy

  def self.titles_by_category_title(category_title)
    self.joins(:category)
        .where('categories.title = ?', category_title)
        .order(title: :desc)
        .pluck(:title)
  end
end
