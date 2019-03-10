class Test < ApplicationRecord
  belongs_to :category
  has_many :question, dependent: :destroy
end
