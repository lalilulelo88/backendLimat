const sql = require("./db");

// constructor
const Guia = function(guia) {
    this.id = guia.id
    this.numero = guia.numero
  this.estado = guia.estado;

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

Guia.findById = (guiaId, result) => {
  sql.query(`SELECT * FROM guia_ingreso WHERE id = ${guiaId}`, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    if (res.length) {
      console.log("found guia: ", res[0]);
      result(null, res[0]);
      return;
    }

    // not found Pallet with the id
    result({ kind: "not_found" }, null);
  });
};

Guia.getAll = result => {
  sql.query("SELECT * FROM guia_ingreso  WHERE estado_guia = 0 ", (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    console.log("guias: ", res);
    result(null, res);
  });
};

Guia.updateById = (id, guia, result) => {
  sql.query(
    "UPDATE guia_ingreso SET estado_guia = ? WHERE id = ?",
    [guia.estado, id],
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

      console.log("updated pallet: ", { id: id, ...guia });
      result(null, { id: id, ...guia });
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

module.exports = Guia;