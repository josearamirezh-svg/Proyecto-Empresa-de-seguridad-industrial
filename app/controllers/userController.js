import { conexion } from "../conexion.js";
import bcrypt from "bcrypt";

export const registerUser = (req, res) => {
  const { username, password, email } = req.body;

  console.log("📩 Datos recibidos del frontend:", req.body);

  if (!username || !password || !email) {
    console.log("❌ Faltan datos para registrar");
    return res.status(400).json({ message: "Faltan datos" });
  }

  const hashedPassword = bcrypt.hashSync(password, 10);
  const sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";

  conexion.query(sql, [username, email, hashedPassword], (err, result) => {
    if (err) {
      console.error("❌ Error MySQL:", err);
      return res.status(500).json({ message: "Error al registrar", error: err });
    }

    console.log("✅ Usuario registrado correctamente:", username);
    res.json({ message: "Usuario registrado correctamente" });
  });
};

export const loginUser = async (req, res) => {
  const { email, password } = req.body;

  if (!email || !password)
    return res.status(400).json({ message: "Faltan datos" });

  const query = "SELECT * FROM users WHERE email = ?";
  conexion.query(query, [email], async (err, results) => { // 👈 CAMBIO AQUÍ
    if (err) {
      console.error("❌ Error al buscar usuario:", err);
      return res.status(500).json({ message: "Error del servidor" });
    }

    if (results.length === 0) {
      return res.status(404).json({ message: "Usuario no encontrado" });
    }

    const user = results[0];
    const match = await bcrypt.compare(password, user.password);

    if (!match) {
      return res.status(401).json({ message: "Contraseña incorrecta" });
    }

    res.status(200).json({
      message: "Inicio de sesión exitoso",
      user: { id: user.id, username: user.username, email: user.email },
    });
  });
};
