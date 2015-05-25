class Answer < ActiveRecord::Base
  belongs_to :question

  validates :content, presence: true, length: {minimum: 2, maximum: 20}
end
