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