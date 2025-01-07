const express = require("express");
const bodyParser = require("body-parser");
const cors = require('cors');
const path = require('path');
const adminRoutes = require('./server-module1-admin');
const db = require('./server-module2-db-connection'); // Import the shared database connection
const entregasRoutes = require('./server-module3-entregas');

const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(adminRoutes); // Handles /get_data_from_general_data_table_for_admin and /get_entregas_log_data
app.use(entregasRoutes);

// Serve the static pages from the 'public' directory
app.use(express.static(path.join(__dirname, 'public')));
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.get('/get_all_vehicles_from_vehicles_data_cars_list', (req, res) => {
    const sql = 'SELECT * FROM vehicles_data_cars_list';
    db.query(sql, (error, results) => {
        if (error) {
            throw error;
        } else {
            if (results.length > 0) {
                res.json(results);
                console.log(results);
            } else {
                res.send('NO RESULTS');
            }
        }
    });
});

app.post('/post_client_data_into_server', (req, res) => {
    console.log('POST body: desde SERVER.JS TO MYSQL', req.body);
    const dataSentFromClient = req.body;
    const fields = ['vehicles_id', 'user_name', 'vehicle_name', 'reason_for_needing_the_vehicle', 'initial_date', 'return_date'];
    const allFieldsPresent = fields.every(field => dataSentFromClient[field] !== '');

    if (allFieldsPresent) {
        const sqlInsert = `INSERT INTO general_data (${fields.join(', ')}) VALUES (?, ?, ?, ?, ?, ?)`;

        db.query(sqlInsert, fields.map(field => dataSentFromClient[field]), (error, results) => {
            if (error) {
                console.log('Error: Variables do not match IN DBQUERY SERVER.JS ', error);
                res.status(500).send('SERVER ERROR');
            } else {
                console.log('Success:', results);
                res.status(200).send('DATA ADDED SUCCESSFULLY!');

                const vehicleId = dataSentFromClient.vehicles_id;
                db.query('UPDATE vehicles_data_cars_list SET vehicle_status = ? WHERE vehicles_id = ?', [1, vehicleId], (error, results) => {
                    if (error) {
                        console.error('Error updating vehicle status IN SERVER.JS', error);
                    }
                });
            }
        });
    } else {
        res.status(400).send('Data cannot be saved');
    }
});

app.listen(80, () => {
    console.log(`Server running on port 80`);
});
