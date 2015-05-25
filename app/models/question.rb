class Question < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :exams, through: :results

  validates :content, presence: true, length: {minimum: 2, maximum: 20}

  accepts_nested_attributes_for :answers, allow_destroy: true,
  reject_if: :all_blank
end
