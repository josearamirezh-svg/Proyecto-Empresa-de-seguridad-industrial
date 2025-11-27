// conexion.js
import mysql from "mysql2";

export const conexion = mysql.createConnection({
  host: "localhost",
  user: "root",         // ⚠️ Cambia si tu usuario es otro
  password: "***",         // ⚠️ Pon tu contraseña de MySQL aquí
  database: "db_mis_pronaltex"
});

conexion.connect((err) => {
  if (err) {
    console.error("❌ Error al conectar con la base de datos:", err);
    return;
  }
  console.log("✅ Conexión exitosa a la base de datos MySQL");
});


export default conexion;
