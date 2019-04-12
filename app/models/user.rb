class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :trackable

  has_many :tests_passages
  has_many :tests, through: :tests_passages
  has_many :own_tests, class_name: 'Test', inverse_of: 'author'

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "format is incorrect" }
  validates :email, uniqueness: true

  before_save :before_save_set_name_from_email, if: ->(user) { user.name.to_s.empty? }

  def tests_passage(test)
    tests_passages.where(test_id: test.id).order(:id).last
  end

  def admin?
    self.class == Admin
  end

  private

  def before_save_set_name_from_email
    /^([^@]+)/ =~ email
    self.name = Regexp.last_match(1)
  end
end
