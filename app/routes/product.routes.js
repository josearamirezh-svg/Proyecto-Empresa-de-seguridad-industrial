import { Router } from "express";
import db from "../conexion.js";

const router = Router();

// 👉 SIN /productos
router.get("/", (req, res) => {
  const sql = "SELECT * FROM producto";

  db.query(sql, (err, results) => {
    if (err) {
      console.error("❌ Error al obtener productos:", err);
      return res.status(500).json({ error: "Error del servidor" });
    }

    res.json(results);
  });
});

export default router;
