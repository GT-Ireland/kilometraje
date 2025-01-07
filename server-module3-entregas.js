
// page name server-module3-entregas.js 

//* VALIDATE RECEIVED DATA AND UPDATE POST TO vehicles_data_cars_list DB
const express = require('express'); 
const router = express.Router(); //& CREATE ROUTER INSTANCE
const db = require('./server-module2-db-connection');

router.post('/vehicles_data_cars_list', (req, res) => {
    console.log('Received HTTP POST request for vehicles_data_cars_list with data', req.body);

    const dataSentFromClient = req.body;
    const { vehicles_id, new_kilometers, initial_kilometers, vehicle_status } = dataSentFromClient;

    if (vehicles_id && new_kilometers !== undefined && vehicle_status !== undefined) {
        // Update vehicles_data_cars_list
        const sqlUpdate = `UPDATE vehicles_data_cars_list SET current_kilometers = COALESCE(?, current_kilometers), vehicle_status = ? WHERE vehicles_id = ?`;

        db.query(sqlUpdate, [new_kilometers, vehicle_status, vehicles_id], (error, results) => {
            if (error) {
                console.error('Error updating vehicles_data_cars_list:', error);
                res.status(500).send('SERVER ERROR UPDATING vehicles_data_cars_list');
            } else {
                console.log('Success updating vehicles_data_cars_list:', results);
            }
        });
    } else {
        res.status(400).send('Missing required fields for vehicles_data_cars_list');
    }
});

router.post('/save_entregas_log', (req, res) => {
    console.log('Received HTTP POST request to save entregas log with data', req.body);

    const { vehicle_name, initial_kilometers, current_kilometers, reason, return_date, entregas_name } = req.body; 

    if (vehicle_name && initial_kilometers !== undefined && current_kilometers !== undefined && reason && entregas_name) { 
        const sqlInsert = `INSERT INTO entregas_log (vehicle_name, initial_kilometers, current_kilometers, reason, return_date, entregas_name) VALUES (?, ?, ?, ?, ?, ?)`; 

        db.query(sqlInsert, [vehicle_name, initial_kilometers, current_kilometers, reason, return_date, entregas_name], (error, results) => { 
            if (error) {
                console.error('Error inserting data into entregas_log:', error);
                res.status(500).send('SERVER ERROR INSERTING INTO entregas_log');
            } else {
                console.log('Success inserting into entregas_log:', results);
                res.status(200).json({ message: 'Data saved successfully in entregas_log' });
            }
        });
    } else {
        res.status(400).send('Missing required fields for entregas_log');
    }
});


module.exports = router; 
