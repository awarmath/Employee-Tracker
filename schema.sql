CREATE DATABASE employee_tracker;

CREATE TABLE employee (
    id INTEGER PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role_id INT FOREIGN KEY,
    manager_id INT FOREIGN KEY,
    FOREIGN KEY (role_id) REFERENCES role(id)
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE role (
    id INTEGER PRIMARY KEY,
    title VARCHAR(30),
    salary DECIMAL,
    department_id INT FOREIGN KEY,
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE department (
    id INTEGER PRIMARY KEY,
    name VARCHAR(30),
);