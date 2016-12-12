class Question < ActiveRecord::Base

  validates :poll_id, presence: true

  belongs_to :poll,
  primary_key: :id,
  foreign_key: :poll_id,
  class_name: :Poll

  has_many :answer_choices,
  primary_key: :id,
  foreign_key: :question_id,
  class_name: :AnswerChoice

  has_many :responses,
  through: :answer_choices,
  source: :responses

  def results
    choices = self.answer_choices
    .joins("LEFT JOIN responses ON answer_choices.id = answer_choice_id")
    .select("answer_choices.text, COUNT(*)")
    .group("answer_choices.text").pluck("answer_choices.text, COUNT(*)")

    choice_counts = {}
    choices.each do |choice|
      choice_counts[choice[0]] = choice[1]
    end
    choice_counts
  end
end
