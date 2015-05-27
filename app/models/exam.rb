class Exam < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :results
  has_many :questions, through: :results

  before_save :make_random_questions, unless: :is_done?

  accepts_nested_attributes_for :results, allow_destroy: true,
                                          reject_if: :all_blank

  scope :order_by_created_at, -> {order created_at: :DESC}

  private
  def make_random_questions
    @questions = category.questions.random_questions
    @questions.each {|question| results.build question: question}
  end

  def is_done?
    self.done?
  end
end
