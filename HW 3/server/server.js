const express = require('express');
const sqlite3 = require('sqlite3');
const bodyParser = require('body-parser');


const app = express();



const db = new sqlite3.Database('./vehicles.db', (err) => {
    if (err) {
        console.error(err.message);
    }
    console.log('Connected to the vehicles database.');
});
// //
// const sqlcreate = `
//     CREATE TABLE Vehicles (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         lineNumber TEXT,
//         startStation TEXT,
//         stopStation TEXT,
//         vehicleTypeCol TEXT
//     );
// `;
//
// db.run(sqlcreate, (err) => {
//     if (err) {
//         console.error(err.message);
//     } else {
//         console.log("Table created successfully.");
//     }
// });


const port = 3000;
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});

// db.get('SELECT * FROM Vehicles WHERE id = 1', (err, row) => {
//     if (err) {
//         console.error(err.message);
//     } else {
//         console.log(row);
//     }
// });

app.use(bodyParser.json());


app.use((req, res, next) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.setHeader("Access-Control-Allow-Headers", "*");
    next();
});

app.get('/', (req, res) => {
    res.send('Welcome to the Vehicles API');
});

// app.get('/vehicles', (req, res) => {
//     // res.send('This is the vehicles route');
//     db.all('SELECT * FROM Vehicles', (err, rows) => {
//         if (err) {
//             console.error(err.message);
//             res.sendStatus(500);
//             return;
//         }
//         res.json(rows);
//     });
// });

//
// app.get('/vehicles', (req, res) => {
//     db.all('SELECT * FROM Vehicles', (err, rows) => {
//         if (err) {
//             console.error(err.message);
//             res.sendStatus(500);
//             return;
//         }
//         res.json(rows);
//     });
// });

app.post('/vehicles', (req, res) => {
    const {lineNumber, startStation, stopStation, vehicleTypeCol} = req.body;

    db.run(`INSERT INTO Vehicles (lineNumber, startStation, stopStation, vehicleTypeCol)
            VALUES (?,?,?,?)`, [lineNumber, startStation, stopStation, vehicleTypeCol], function(err) {
        if (err) {
            console.error(err.message);
            res.sendStatus(500);
            return;
        }
        res.sendStatus(201);
    });
});

app.put('/vehicles/:id', (req, res) => {
    const id = req.params.id;
    const { lineNumber, startStation, stopStation, vehicleTypeCol } = req.body;
    const sql = `UPDATE Vehicles SET lineNumber = ?, startStation = ?, stopStation = ?, vehicleTypeCol = ? WHERE id = ?`;
    db.run(sql, [lineNumber, startStation, stopStation, vehicleTypeCol, id], function(err) {
        if (err) {
            console.error(err.message);
            res.sendStatus(500);
            return;
        }
        res.sendStatus(200);
    });
});

app.delete('/vehicles/:id', (req, res) => {
    const id = req.params.id;
    db.run(`DELETE FROM Vehicles WHERE id = ${id}`, (err) => {
        if (err) {
            console.error(err.message);
            res.sendStatus(500);
            return;
        }
        res.sendStatus(200);
    });
});

