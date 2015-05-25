class Exam < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :results
  has_many :questions, through: :results

  accepts_nested_attributes_for :results, allow_destroy: true, 
  reject_if: :all_blank
end
