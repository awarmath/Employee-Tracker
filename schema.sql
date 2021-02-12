DROP DATABASE IF EXISTS employee_trackerDB;
CREATE DATABASE employee_trackerDB;
USE employee_trackerDB;

CREATE TABLE employee (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    manager_id INT,
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES role(id),
    FOREIGN KEY ('manager_id') REFERENCES employee(id)
);

CREATE TABLE role (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(30),
    salary DECIMAL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE department (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30)
);

-- Employees --
INSERT INTO employee (first_name, last_name, manager_id, role_id)
VALUE ("Natalie", "Barker", 9, 1);
INSERT INTO employee (first_name, last_name, manager_id, role_id)
VALUE ("Randi", "Marshall", 8, 2);
INSERT INTO employee (first_name, last_name, manager_id, role_id)
VALUE ("Joe","Kilpatrick", 7, 3);
INSERT INTO employee (first_name, last_name, manager_id, role_id)
VALUE ("Josh", "Dorr", 6, 4);
INSERT INTO employee (first_name, last_name, manager_id, role_id)
VALUE ("Aaron", "Odaniel", 5, 5);
INSERT INTO employee (first_name, last_name, manager_id, role_id)
VALUE ("Jessica", "Hamilton", 4, 6);
INSERT INTO employee (first_name, last_name, manager_id, role_id)
VALUE ("Alex", "Johnson", 3, 7);
INSERT INTO employee (first_name, last_name, manager_id, role_id)
VALUE ("Chris", "Carr", 2, 8);
INSERT INTO employee (first_name, last_name, manager_id, role_id)
VALUE ("Trisha", "Jennings", 1, 9);

-- Roles --
INSERT INTO role (title, salary, department_id)
VALUE ("Senior Marketing", 100000, 1);
INSERT INTO role (title, salary, department_id)
VALUE ("Junior Marketing", 60000, 1);
INSERT INTO role (title, salary, department_id)
VALUE ("Controller", 75000, 2);
INSERT INTO role (title, salary, department_id)
VALUE ("Assistant Controller", 50000, 2);
INSERT INTO role (title, salary, department_id)
VALUE ("Senior Sales", 125000, 3);
INSERT INTO role (title, salary, department_id)
VALUE ("Junior Sales", 60000, 3);
INSERT INTO role (title, salary, department_id)
VALUE ("Senior Creative", 80000, 4);
INSERT INTO role (title, salary, department_id)
VALUE ("Junior Creative", 60000, 4);

-- Departments --
INSERT INTO department (name)
VALUE ("Marketing");
INSERT INTO department (name)
VALUE ("Administrative");
INSERT INTO department (name)
VALUE ("Sales");
INSERT INTO department (name)
VALUE ("Creative");

SELECT * FROM employee;
SELECT * FROM role;
SELECT * FROM department;
