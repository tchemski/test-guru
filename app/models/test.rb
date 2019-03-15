class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  scope :with_difficulty, ->(levels) { where(level: levels) }
  scope :easy, -> { with_difficulty(0..1) }
  scope :normal, -> { with_difficulty(2..4) }
  scope :hard, -> { with_difficulty(5..Float::INFINITY) }

  scope :titles_by_category_title,
        lambda { |category_title|
          # вызов .unscope(:order) не нужен, потому что .order(title: :desc)
          # перекрывает дефолтный порядок
          joins(:category)
            .where('categories.title = ?', category_title)
            .order(title: :desc)
            .pluck(:title)
        }
end
