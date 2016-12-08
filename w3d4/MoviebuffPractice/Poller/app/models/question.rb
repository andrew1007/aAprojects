class Question < ActiveRecord::Base

  has_many :answer_choices,
  primary_key: :id,
  foreign_key: :question_id,
  class_name: :AnswerChoice

  belongs_to :poll,
  primary_key: :id,
  foreign_key: :poll_id,
  class_name: :Poll

  has_many :questions,
  primary_key: :id,
  foreign_key: :question_id,
  class_name: :Response

end
