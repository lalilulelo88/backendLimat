const express = require("express");
const bodyParser = require("body-parser");

const app = express();

app.use(function(req, res, next) {
    res.header('Access-Control-Allow-Credentials', true);
    res.header('Access-Control-Allow-Origin', req.headers.origin);
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'X-Requested-With, X-HTTP-Method-Override, Content-Type, Accept');
    next();
  });



//rutas
var appRoutes = require('./routes/app');
var palletRoutes = require('./routes/pallets.js');
var guiaRoutes = require('./routes/guias.js');


// parse requests of content-type: application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }));
// parse requests of content-type: application/json
app.use(bodyParser.json());


app.use('/pallets',palletRoutes);
app.use('/guias',guiaRoutes);


// simple route
// app.get("/", (req, res) => {
//     console.log('Base de datos: \x1b[32m%s\x1b[0m', 'online');
//   res.json({ message: "Welcome to bezkoder application." });
// });


app.use('/',appRoutes);
// set port, listen for requests
app.listen(process.env.PORT || 8080, () => {
    console.log('Express server puerto XXXX: \x1b[32m%s\x1b[0m', 'online');
});