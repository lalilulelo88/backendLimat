var express = require("express");
var app = express();
var pallets = require("../controller/pallet.controller");
  
    // Create a new Customer
   // app.post("/pallets", pallets.create);
  
    // Retrieve all Customers
    app.get("/", pallets.findAll);
  
    // Retrieve a single Customer with customerId
    app.get("/:id", pallets.findOne);
  
    // Update a Customer with customerId
    app.put("/:id", pallets.update);
  
    // Delete a Customer with customerId
  //  app.delete("/pallets/:customerId", pallets.delete);
  
    // Create a new Customer
  //  app.delete("/pallets", pallets.deleteAll);
 

  module.exports = app ;