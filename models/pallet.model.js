const sql = require("./db");

// constructor
const Pallet = function(pallet) {
  this.estado = pallet.estado;

};

// Pallet.create = (newPallet, result) => {
//   sql.query("INSERT INTO pallets SET ?", newPallet, (err, res) => {
//     if (err) {
//       console.log("error: ", err);
//       result(err, null);
//       return;
//     }

//     console.log("created pallet: ", { id: res.insertId, ...newPallet });
//     result(null, { id: res.insertId, ...newPallet });
//   });
// };

Pallet.findById = (palletId, result) => {
  sql.query(`SELECT * FROM pallet WHERE id = ${palletId}`, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    if (res.length) {
      console.log("found pallet: ", res[0]);
      result(null, res[0]);
      return;
    }

    // not found Pallet with the id
    result({ kind: "not_found" }, null);
  });
};

Pallet.getAll = result => {
  sql.query("SELECT * FROM pallet", (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    console.log("pallets: ", res);
    result(null, res);
  });
};

Pallet.updateById = (id, pallet, result) => {
  sql.query(
    "UPDATE pallet SET id_estadoPallet = ? WHERE id = ?",
    [pallet.estado, id],
    (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(null, err);
        return;
      }

      if (res.affectedRows == 0) {
        // not found Pallet with the id
        result({ kind: "not_found" }, null);
        return;
      }

      console.log("updated pallet: ", { id: id, ...pallet });
      result(null, { id: id, ...pallet });
    }
  );
};

  // Pallet.remove = (id, result) => {
  //   sql.query("DELETE FROM pallets WHERE id = ?", id, (err, res) => {
  //     if (err) {
  //       console.log("error: ", err);
  //       result(null, err);
  //       return;
  //     }

  //     if (res.affectedRows == 0) {
  //       // not found Pallet with the id
  //       result({ kind: "not_found" }, null);
  //       return;
  //     }

  //     console.log("deleted pallet with id: ", id);
  //     result(null, res);
  //   });
  // };

// Pallet.removeAll = result => {
//   sql.query("DELETE FROM pallets", (err, res) => {
//     if (err) {
//       console.log("error: ", err);
//       result(null, err);
//       return;
//     }

//     console.log(`deleted ${res.affectedRows} pallets`);
//     result(null, res);
//   });
// };

module.exports = Pallet;