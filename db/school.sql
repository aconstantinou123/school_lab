DROP TABLE houses;
DROP TABLE students;

CREATE TABLE houses (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE students (
  id SERIAL4,
  first_name VARCHAR(255),
  second_name VARCHAR(255),
  house_id INT4 REFERENCES houses(id),
  age INT4
);
