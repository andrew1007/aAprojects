require_relative 'questionsdatabase'

class QuestionFollows
  attr_accessor :id, :user_id, :question_id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.all
    all = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
    all.map { |datum| QuestionFollows.new(datum) }
  end


  def self.find_by_id(id)
    user_question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL
    QuestionFollows.new(user_question.first)
  end

  def self.followers_for_question_id(question_id)
    user_question = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_follows
      JOIN
        users ON users.id = question_follows.user_id
      WHERE
        question_id = ?
    SQL
    user_question.map { |user| Users.new(user) }
  end

  def self.followed_questions_for_user_id(user_id)
    followed_questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_follows
      JOIN
        questions ON questions.id = question_follows.question_id
      WHERE
        user_id = ?
    SQL
    followed_questions.map { |ques| Questions.new(ques) }
  end

  def self.most_followed_questions(n)
    most_followed_questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        questions
      JOIN
        question_follows ON questions.id = question_follows.question_id
      GROUP BY
        questions.title
      ORDER BY
        COUNT(question_id) DESC
      LIMIT
        ?
    SQL
    most_followed_questions.map { |ques| Questions.new(ques) }
  end


end
