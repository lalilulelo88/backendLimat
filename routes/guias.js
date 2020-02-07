var express = require("express");
var app = express();
var guias = require("../controller/guia.controller");
  
    // Create a new Customer
   // app.post("/pallets", pallets.create);
  
    // Retrieve all Customers
    app.get("/", guias.findAll);
  
    // Retrieve a single Customer with customerId
    app.get("/:id", guias.findOne);
  
    // Update a Customer with customerId
    app.put("/:id", guias.update);
  
    // Delete a Customer with customerId
  //  app.delete("/pallets/:customerId", pallets.delete);
  
    // Create a new Customer
  //  app.delete("/pallets", pallets.deleteAll);
 

  module.exports = app ;