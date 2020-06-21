const express = require("express");
const bodyParser = require("body-parser");
//const cors = require("cors");
const path = require('path');
const hbs = require('hbs');
const app = express();

//const routes=require('./routes/agenda.routers');

/*require("./routes/libro.routes")(app);
var corsOptions = {
  origin: "http://localhost:8081"
};*/


// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');
app.use(bodyParser.urlencoded({ extended: false }));
app.use('/assets',express.static(__dirname + '/public'));


//app.use(cors(corsOptions));

// parse requests of content-type - application/json
app.use(bodyParser.json());

// parse requests of content-type - application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }));

// simple route
app.get("/", (req, res) => {
  res.json({ message: "Bienvenidos a Biblioteca" });
});

// set port, listen for requests
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});