CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN_KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  users_id INTEGER NOT NULL,
  questions_id INTEGER NOT NULL,

  FOREIGN_KEY (users_id) REFERENCES users(id),
  FOREIGN_KEY (questions_id) REFERENCES questions(id)

);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  questions_id INTEGER NOT NULL,  -- reference to the subject question.
  parent_reply_id INTEGER,        --  reference to its parent reply.  
  users_id INTEGER NOT NULL,      -- reference to the user who wrote it.
  body TEXT NOT NULL,             -- body of a reply

  FOREIGN_KEY (questions_id) REFERENCES questions(id),
  FOREIGN_KEY (parent_reply_id) REFERENCES replies(id),
  FOREIGN_KEY (users_id) REFERENCES users(id)
);


-- question follows id, users id, questions id

-- id |
-- question|
-- reply|
