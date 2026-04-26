CREATE TABLE users (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100)
);

INSERT INTO
  users (id, name, email)
VALUES
  (1, 'alice', 'qwe@qwe.com');

SELECT
  name
FROM
  users
WHERE
  id = 1;
