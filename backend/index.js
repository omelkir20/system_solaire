const express = require('express');
const mysql = require('mysql2');
const app = express();
const Port = 3000;

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root', 
    password: '', 
    database: 'system_solaire' 
});

db.connect(err => {
    if (err) {
        console.error('Error connecting to the database:', err);
        return;
    }
    console.log('Connected to MySQL database');
});

app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));

app.listen(Port, () => {
    console.log(`Successfully connected to port ${Port}`);
});

app.post("/api/add_planet", (req, res) => {
    const { pnom, pdistance, pradius, pgravity } = req.body;

    if (!pnom || !pdistance || !pradius || !pgravity) {
        return res.status(400).send({
            "Status_code": 400,
            "Message": "All fields are required"
        });
    }

    const query = `INSERT INTO planet (pnom, pdistance, pradius, pgravity) VALUES (?, ?, ?, ?)`;
    db.query(query, [pnom, pdistance, pradius, pgravity], (err, result) => {
        if (err) {
            console.error('Error inserting data:', err);
            return res.status(500).send({
                "Status_code": 500,
                "Message": "Failed to add planet data",
                "Error": err.message
            });
        }

        console.log("Final RESULT", result);
        res.status(200).send({
            "Status_code": 200,
            "Message": "Planet Data Is ADDED Successfully",
            "Planet_ID": result.insertId
        });
    });
});
// GET Planet
app.get("/api/get_planet", (req, res) => {
    const query = 'SELECT * FROM planet'; 
    db.query(query, (err, results) => {
        if (err) {
            console.error('Error retrieving data:', err);
            return res.status(500).send({
                'status_code': 500,
                'message': 'Failed to retrieve planet data',
                'error': err.message
            });
        }

        if (results.length > 0) {
            res.status(200).send({
                'status_code': 200,
                'planet': results
            });
        } else {
            res.status(200).send({
                'status_code': 200,
                'planet': []
            });
        }
    });
});
