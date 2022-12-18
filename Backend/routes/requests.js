// importing packages
const express = require('express');
const router = express.Router();



router.get(`/:id`, function (req, res) {
	MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    var dbo = db.db("MaximumLevel");
    dbo.collection("sensors").findOne({
        id: req.params.id
    }, 
    function(err, result) {
        if (err) throw err;
        res.json(result);
        db.close();
    });
  });
});

router.post(`/`, function (req, res) {
	MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    var dbo = db.db("MaximumLevel");
    dbo.collection("sensors").insertOne({
        id: req.body.id,
        waterDetected: req.body.waterDetected,
        city: req.body.city,
        areaName: req.body.areaName,
        coordinates: {
          longitude: req.body.longitude,
          latitude: req.body.latitude
        }
    }, 
    function(err, result) {
        if (err) throw err;
        res.json(result);
        db.close();
    });
  });
});

module.exports = router;