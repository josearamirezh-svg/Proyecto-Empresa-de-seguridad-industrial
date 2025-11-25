import conexion from "./conexion.js";

// Función para obtener datos desde la base de datos
export const obtenerUsuarios = () => {
  return new Promise((resolve, reject) => {
    const query = "SELECT * FROM users"; // Cambia la tabla según lo que quieras consultar

    conexion.query(query, (err, results) => {
      if (err) {
        reject("Error ejecutando la consulta: " + err);
      } else {
        resolve(results);
      }
    });
  });
};
