import { conexion } from "../conexion.js";

export const getProducts = async (req, res) => {
  try {
    const [rows] = await conexion.query("SELECT * FROM producto");
    res.json(rows);
  } catch (error) {
    console.error("Error al obtener productos:", error);
    res.status(500).json({ message: "Error al obtener productos" });
  }
};
