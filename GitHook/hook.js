var express = require("express");
var app = express();
var bodyParser = require("body-parser");
require('dotenv').config();

//Const
var secret = process.env.KEY || "mykey"
var port = "8000";

app.use(bodyParser.json());

var server = app.listen(port,function() {
  console.log(
    "App listening on the port %s",
    server.address().port
  );
});


app.post("/", function(req, res) {
  // TODO: check secret passphrase from github webhook
  // check event type
  var event = req.get("X-GitHub-Event");

  if(event == "ping"){
    res.status(202).send({message: "Ping for webhook catch"});
  }
  else if(event == "push"){
    res.status(202).send({message: "Push catch"});
  }else{
    res.status(404).send({message: "Type of event not managed"});
  }
});
