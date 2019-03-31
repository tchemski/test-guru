class Test < ApplicationRecord
  ACCEPTABLE_PERCENTAGE = 85

  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :tests_passages
  has_many :users, through: :tests_passages
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  scope :with_difficulty, ->(levels) { where(level: levels) }
  scope :easy, -> { with_difficulty(0..1) }
  scope :normal, -> { with_difficulty(2..4) }
  scope :hard, -> { with_difficulty(5..Float::INFINITY) }
  scope :by_category_title,
        lambda { |category_title|
          joins(:category)
            .where('categories.title = ?', category_title)
        }
  scope :with_questions_count,
        lambda {
          select('tests.*, count(questions.test_id) AS questions_count')
            .left_outer_joins(:questions)
            .group(:id)
        }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level,
                                  message: 'should happen uniq per level' }

  def self.titles_by_category_title(category_title)
    by_category_title(category_title)
      .order(title: :desc)
      .pluck(:title)
  end

  def ordered_questions
    questions.order(:id)
  end
end
