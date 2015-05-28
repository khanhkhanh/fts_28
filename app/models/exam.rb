class Exam < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :results
  has_many :questions, through: :results

  before_save :make_random_questions, unless: :is_done?
  before_update :mark_the_exam, :update_correct_answers, if: :is_done?

  accepts_nested_attributes_for :results, allow_destroy: true, 
                                          reject_if: :all_blank

  scope :order_by_created_at, -> {order created_at: :DESC}

  private
  def make_random_questions
    @questions = category.questions.random_questions
    @questions.each {|question| results.build question: question}
  end

  def mark_the_exam
    self.mark = results.select do |result|
      Answer.find(result.answer_id).correct? if result.answer_id?
    end.count
  end

  def update_correct_answers
    results.each do |result|
      result.answer_id? ? result.correct = Answer.find(result.answer_id).correct? : false
    end
  end

  def is_done?
    self.done?
  end
end
