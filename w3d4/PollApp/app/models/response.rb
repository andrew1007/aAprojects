class Response < ActiveRecord::Base

  validates :user_id, :answer_choice_id, presence: true
  validate :not_duplicate_response, :not_own_poll

  belongs_to :answer_choice,
  primary_key: :id,
  foreign_key: :answer_choice_id,
  class_name: :AnswerChoice

  belongs_to :respondent,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  # has_many :sibling_responses,
  # through: :answer_choice,
  # through: :questions

  has_one :question,
  through: :answer_choice,
  source: :question

  has_one :poll,
  through: :question,
  source: :poll


  def sibling_responses
    self.question.responses
      .where.not("responses.id = ?", self.id)
  end

  def respondent_already_answered?
    self.sibling_responses.pluck(:user_id).include?(self.user_id)
  end

  def not_duplicate_response
    if respondent_already_answered?
      self.errors[:user] << "already responded."
    end
  end

  def not_own_poll
    if self.poll.user_id == self.user_id
      self.errors[:user] << "is creator of poll"
    end
  end
end
