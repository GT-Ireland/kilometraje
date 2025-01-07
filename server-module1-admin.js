// admin server code server-module1-admin.js

const express = require("express");
const router = express.Router(); 
const db = require('./server-module2-db-connection'); 

router.get('/get_data_from_general_data_table_for_admin', (req, res) => {
    const sql = `
        SELECT * FROM general_data
        ORDER BY submission_time DESC
    `;

    db.query(sql, (error, results) => {
        if (error) {
            console.error('Server Error ADMIN SECTION:', error);
            res.status(500).json({ error: 'Server Error ADMIN SECTION', details: error.message });
        } else {
            res.json(results);
        }
    });
});

router.get('/get_entregas_log_data', (req, res) => {
    const sql = `
        SELECT * FROM entregas_log
    `;

    db.query(sql, (error, results) => {
        if (error) {
            console.error('Server Error ADMIN SECTION:', error);
            res.status(500).json({ error: 'Server Error ADMIN SECTION', details: error.message });
        } else {
            res.json(results);
        }
    });
});

router.get('/get_vehicle_data', (req, res) => {
    const sql = 'SELECT vehicle_name, current_kilometers FROM vehicles_data_cars_list';
    db.query(sql, (error, results) => {
        if (error) {
            console.error('Server Error VEHICLE DATA:', error);
            res.status(500).json({ error: 'Server Error VEHICLE DATA', details: error.message });
        } else {
            res.json(results);
        }
    });
});


module.exports = router;
