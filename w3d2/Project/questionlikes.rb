require_relative 'questionsdatabase'
require_relative 'questions'

class QuestionLikes
  attr_accessor :id, :question_id, :user_id

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
    data.map { |datum| QuestionLikes.new(datum) }
  end

  def self.find_by_id(id)
    like = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL
    QuestionLikes.new(like.first)
  end

  def self.likers_for_question_id(question_id)
    like = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_likes ON users.id = question_likes.user_id
      WHERE
        question_id = ?
    SQL
    like.map { |liker| Users.new(liker) }
  end

  def self.num_likes_for_question_id(question_id)
    like = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(user_id)
      FROM
        question_likes
      WHERE
        question_id = ?
      GROUP BY
        question_id
    SQL
    like.first.values.first
  end

  def self.liked_questions_for_user_id(user_id)
    like = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.question_id
      WHERE
        user_id = ?
    SQL
    like.map { |liker| Questions.new(liker) }

  end

  def self.most_liked_questions(n)
    most_liked_questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.question_id
      GROUP BY
        question_likes.question_id
      ORDER BY
        COUNT(question_id) DESC
      LIMIT
        ?
    SQL
    most_liked_questions.map { |liked| Questions.new(liked) }
  end

end
