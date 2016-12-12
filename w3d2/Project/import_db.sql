CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
  --FOREIGN KEYS AND REFERENCE KEYS?
);

CREATE TABLE questions(
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY(author_id) REFERENCES users(id)
);

CREATE TABLE question_follows(
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY(question_id) REFERENCES questions(id),
  FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY(question_id) REFERENCES questions(id),
  FOREIGN KEY(parent_id) REFERENCES replies(id),
  FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Mark', 'Noizumi'),
  ('Andrew', 'Yueh'),
  ('Bob', 'Jones'),
  ('John', 'Smith');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Math?', 'What is 1 + 1', 2),
  ('Life?', 'What is the meaning of it?', 1),
  ('asdf', 'asdfgfdg', 2);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  (2, 1),
  (1, 2);

INSERT INTO
  replies (question_id, parent_id, user_id, body)
VALUES
  (1, NULL, 2, "What a great question!"),
  (1, 1, 1, "No, that's a terrible question");

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 1),
  (4, 3);
