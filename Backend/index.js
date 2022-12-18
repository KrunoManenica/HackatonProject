// imports
const express = require('express');
const app = express();

// middlewares
app.use(express.json());

// Database
let MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/";

// port
const port = process.env.PORT || 5500;
app.listen(port, () => console.log(`Listening on Port: ${port}`));

app.get('/:id', function (req, res) {
	MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    var dbo = db.db("MaximumLevel");
    dbo.collection("sensors").findOne({
        id: "2222"
    }, 
    function(err, result) {
        if (err) throw err;
        res.json(result);
        db.close();
    });
  });
});

app.post('/', function (req, res) {
	MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    const wd = req.body.uplink_message.decoded_payload.myTestValue < 900;
    var dbo = db.db("MaximumLevel");
    dbo.collection("sensors").replaceOne(
      { id: "2222"},
      {
        id: "2222",
        waterDetected: wd,
        city: "Split",
        areaName: "Spinut",
        "coordinates": {
          "longitude": 16.4228088,
          "latitude": 43.5143802
      }
    },
    {upsert: true}, 
    function(err, result) {
        if (err) throw err;
        res.json(result);
        db.close();
    });
  });
});