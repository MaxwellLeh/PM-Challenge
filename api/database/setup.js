const db = require('./connect')
const fs = require('fs')
const pg = require('pg')

db.query(fs.readFileSync('./database/setup.sql').toString()).then(data => console.log("Set up complete"))
.catch(error => console.log("This is error in setup-db: ", error))











// require("dotenv").config();
// const fs = require("fs");

// console.log(__dirname);

// const db = require("./connect");
// const sql = fs.readFileSync(__dirname + "/setup.sql").toString();

// db.query(sql)
//   .then((data) => {
//     db.end();
//     console.log("Set up complete");
//   })
//   .catch((error) => console.log(error));
