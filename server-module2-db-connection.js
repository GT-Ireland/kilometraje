const mysql = require('mysql');

//* MYSQL CONNECTION SETUP
const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "2024",
    database: "vehicles",
});
//* CONNECT TO MYSQL DATABASE
db.connect((err) => {
    if (err) throw err;
    console.log("Connected to the database");
});

module.exports = db; 