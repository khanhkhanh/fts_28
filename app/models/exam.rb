class Exam < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :results
  has_many :questions, through: :results

  before_save :make_random_questions, unless: :is_done?
  before_update :update_correct_answers, :mark_the_exam, if: :is_done?

  accepts_nested_attributes_for :results, allow_destroy: true,
                                          reject_if: :all_blank

  scope :order_by_created_at, -> {order created_at: :DESC}
  scope :inactive_exams, ->time {where("done = 'f' AND created_at < '#{time.ago.to_s(:db)}'")}

  private
  def make_random_questions
    @questions = category.questions.random_questions
    @questions.each {|question| results.build question: question}
  end

  def mark_the_exam
    self.mark = results.select{|result| result.answer_correct}.count
  end

  def update_correct_answers
    results.each{|result| result.correct = result.answer_correct unless result.answer_id.nil?}
  end

  def is_done?
    self.done?
  end

  def self.delete_inactive_exams
    inactive_exams(Settings.expired_time.seconds).each {|exam| exam.destroy}
  end
end
