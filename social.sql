CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(100),
    password VARCHAR(10)
);

CREATE TABLE groups (
    group_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    user_id INTEGER NOT NULL REFERENCES users(user_id)
);

CREATE TABLE user_group (
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    group_id INTEGER NOT NULL REFERENCES groups(group_id)
);

CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    -- group_id INTEGER REFERENCES groups(group_id),
    content TEXT
);

CREATE TABLE comments (
    comment_id SERIAL PRIMARY KEY,
    post_id INTEGER NOT NULL REFERENCES posts(post_id),
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    content TEXT
);

INSERT INTO users(email, password) 
 VALUES ('taryn@dev.com', '12345'),
 ('hatice@dev.com', '12345'),
 ('eric@dev.com', '12345'),
 ('leah@dev.com', '12345'),
 ('joy@dev.com', '12345');

 INSERT INTO posts (user_id, content)
 VALUES 
 (1, 'Hello everyone'),
 (3, 'Your are amazing'),
 (2, 'You will do this'),
 (5, 'Dont give up'),
 (2, 'Love yourself'),
 (3, 'Dont think about others. Only yourself'),
 (5, 'Dont worry be happy'),
 (4, 'Dont forget about me');

 INSERT INTO comments (user_id, post_id, content)
 VALUES
 (2, 13,'You look amazing'),
 (1, 14,'Thank you you are too.'),
 (3, 18,'Thats very selfish of you. But i agree');
 (1, 19,'Thats my favorite song');


 INSERT INTO groups(user_id, name)
 VALUES
 (1, 'Chess Club'),
 (2, 'Debate Club'),
 (4, 'Science Club'),
 (5, 'Coding Club'),
 (3, 'Soccer Club');

 INSERT INTO user_group (user_id, group_id)
 VALUES 
 (1, 5),
 (1, 3),
 (1, 2),
 (2, 4),
 (3, 1),
 (5, 1),
 (4, 1),
 (2, 1);