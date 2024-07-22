// connection.js
const mysql = require('mysql2');

// Create a connection to the database
const connection = mysql.createConnection({
  host: 'localhost',       // Replace with your MySQL host
  user: 'dbuser',            // Replace with your MySQL username
  password: 'test0000',            // Replace with your MySQL password
  database: 'testdb'       // Replace with your MySQL database name
});

// Connect to the MySQL server
connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err.message);
    return;
  }
  console.log('Connected to MySQL');
});

// Initialize the database schema
connection.query(`CREATE TABLE IF NOT EXISTS entries (
  id INT AUTO_INCREMENT PRIMARY KEY,
  value VARCHAR(255) NOT NULL
)`, (err) => {
  if (err) {
    console.error('Error creating table:', err.message);
  }
});

module.exports = connection;
