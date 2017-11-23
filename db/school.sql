DROP TABLE houses;
DROP TABLE students;

CREATE TABLE students (
  id SERIAL4,
  first_name VARCHAR(255),
  second_name VARCHAR(255),
  house VARCHAR(255),
  age INT4
);

CREATE TABLE houses (
  id SERIAL4,
  name VARCHAR(255)
);
