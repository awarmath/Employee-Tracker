const mysql = require('mysql');
const inquirer = require('inquirer');
const consoleTable = require('console.table');
const cTable = require('console.table');

// Create connection
const connection = mysql.createConnection({
    host: 'localhost',
    port: 3001,
    user: 'root',
    password: 'password',
    database: 'employeetrackerDB'
});

connection.connect(function(err) {
    if(err) throw(err)
    console.log('Connected as Id' + connection.threadId)
});

//Initial Menu
function mainMenu() {
    inquirer.prompt ([{
        name: 'choice',
        type: 'list',
        message: 'Main Menu',
        choices: [
            "View all departments",
            "View all roles",
            "View all employees",
            "Add a department",
            "Add a role",
            "Add an employee",
            "Update an employee role"
        ]
    }])
    .then(function(val) {
        if (val.choices === "View all departments") {
            viewDepartments();
        } else if (val.choices === "View all roles") {
            viewRoles();
        } else if (val.choices === "View all employees") {
            viewEmployees();
        } else if (val.choices === "Add a department") {
            addDepartment();
        } else if (val.choices === "Add a role") {
            addRole();
        } else if (val.choices === "Add an employee") {
            addEmployee();
        } else if (val.choices === "Update an employee role") {
            updateEmployeeRole();
        }
    })
}

function viewDepartments() {
    readDepartments().then(
        function(err) {
            if (err) throw err
            console.log("Viewing all departments");
            mainMenu();
        }
    )
}

function viewRoles() {
    readRoleItems().then(
        function(err) {
            if (err) throw err
            console.log("Viewing all roles");
            mainMenu();
        }
    )
}

function viewEmployees() {
    readEmployeeItems().then(
        function(err) {
            if (err) throw err
            console.log("Viewing all employees");
            mainMenu();
        }
    )
}

function addDepartment() {
    inquirer.prompt([{
        name: 'name',
        type: 'input',
        message: 'What Department would you like to add?'
    }
    ]).then (function(answer) {
        const query = connection.query(
            "INSERT INTO department SET ?",
            {
                name: answer.item
            },
            function(err) {
                if (err) throw err
                console.log("You just added a department");
                mainMenu();
            }
        )
    });
}

function addRole() {
    inquirer.prompt([{
        name: 'title',
        type: 'input',
        message: 'What is the new role?'
    },
    {
        name: 'salary',
        type: 'input',
        message: 'What is the salary?'
    }
    ]).then (function(answer) {
        const query = connection.query(
            "INSERT INTO role SET ?",
            {
                name: answer.item,
                salary: answer.item
            },
            function(err) {
                if (err) throw err
                console.log("You just added a role");
                mainMenu();
            }
        )
    });
}

function addEmployee() {
    inquirer.prompt([{
        name: 'first name',
        type: 'input',
        message: "What is the new employee's first name?"
    },
    {
        name: 'last name',
        type: 'input',
        message: "What is the new employee's last name?"
    },
    {
        name: 'role',
        type: 'input',
        message: "What is the new employee's role?"
    },
    {
        name: 'manager',
        type: 'input',
        message: "Whe is the new employee's manager?"
    },
    ]).then (function(answer) {
        const query = connection.query(
            "INSERT INTO employee SET ?",
            {
                first_name: answer.item,
                last_name: answer.item,
                role: answer.item,
                manager: answer.item
            },
            function(err) {
                if (err) throw err
                console.log("You just added a employee");
                mainMenu();
            }
        )
    });
}

