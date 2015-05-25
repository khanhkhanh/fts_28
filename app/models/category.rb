class Category < ActiveRecord::Base
  has_many :exams, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :name, presence: true, length: {minimum: 2, maximum: 50}
  validates :name, uniqueness: true
end
