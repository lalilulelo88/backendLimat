const Guia = require("../models/guia.model.js");

// Create and Save a new Customer
// exports.create = (req, res) => {
  
// };

// Retrieve all Customers from the database.
exports.findAll = (req, res) => {
    Guia.getAll((err, data) => {
      if (err)
        res.status(500).send({
          message:
            err.message || "Some error occurred while retrieving customers."
        });
      else res.send(data);
    });
  };

// Find a single Customer with a customerId
exports.findOne = (req, res) => {
    Guia.findById(req.params.id, (err, data) => {
      if (err) {
        if (err.kind === "not_found") {
          res.status(404).send({
            message: `Not found Guia with id ${req.params.id}.`
          });
        } else {
          res.status(500).send({
            message: "Error retrieving Guia with id " + req.params.id
          });
        }
      } else res.send(data);
    });
  };

// Update a Customer identified by the customerId in the request
exports.update = (req, res) => {
    // Validate Request
    if (!req.body) {
      res.status(400).send({
        message: "Content can not be empty!"
      });
    }
  
    Guia.updateById(
      req.params.id,
      new Guia(req.body),
      (err, data) => {
        if (err) {
          if (err.kind === "not_found") {
            res.status(404).send({
              message: `Not found Customer with id ${req.params.id}.`
            });
          } else {
            res.status(500).send({
              message: "Error updating Customer with id " + req.params.id
            });
          }
        } else res.send(data);
      }
    );
  };

// Delete a Customer with the specified customerId in the request
// exports.delete = (req, res) => {
  
// };

// Delete all Customers from the database.
// exports.deleteAll = (req, res) => {
  
// };