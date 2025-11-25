import express from "express";
import cors from "cors"; // 👈 Recomendado para permitir peticiones del frontend
import path from "path";
import { fileURLToPath } from "url";

import userRoutes from "./routes/user.routes.js"; // 👈 Rutas de usuarios (login/register)
import productRoutes from "./routes/product.routes.js"; // ✅ rutas de productos

const app = express();

// 📁 Configuración para obtener __dirname en ESModules
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// ⚙️ Configuración del servidor
app.set("port", 4000);

// 🧩 Middlewares
app.use(cors()); // 👈 Permite comunicación entre frontend y backend
app.use(express.json()); // Para leer JSON en requests
app.use(express.urlencoded({ extended: true })); // Para leer formularios

// 🗂️ Middleware para servir archivos estáticos
app.use(express.static(path.join(__dirname, "public")));
app.use(express.static(path.join(__dirname, "Imagenes")));
app.use(express.static(path.join(__dirname, "pages")));

app.use(express.static("pages"));
app.use(express.static("public"));

// 🧠 Rutas API (para registro y login)
app.use("/api/users", userRoutes); // 👈 Cambiado de "/api/users" → "/api" (para coincidir con el fetch del frontend)
app.use("/api/productos", productRoutes); // ✅ AHORA SÍ

// 🌐 Rutas principales del sitio
app.get("/", (req, res) =>
  res.sendFile(path.join(__dirname, "/pages/home.html"))
);
app.get("/register", (req, res) =>
  res.sendFile(path.join(__dirname, "/pages/register.html"))
);
app.get("/login", (req, res) =>
  res.sendFile(path.join(__dirname, "/pages/login.html"))
);
app.get("/about", (req, res) =>
  res.sendFile(path.join(__dirname, "/pages/about.html"))
);
app.get("/contact", (req, res) =>
  res.sendFile(path.join(__dirname, "/pages/contact.html"))
);
app.get("/course", (req, res) =>
  res.sendFile(path.join(__dirname, "/pages/course.html"))
);
app.get("/admin", (req, res) =>
  res.sendFile(path.join(__dirname, "/pages/admin/admin.html"))
);
app.get("/equipos_contra_incendios", (req, res) =>
  res.sendFile(path.join(__dirname, "/pages/equipos_contra_incendios.html"))
);

app.post("/register", async (req, res) => {
  const { user, email, password } = req.body;
  console.log("📩 Datos recibidos:", req.body); // 👈 Esto nos ayuda a depurar

  if (!user || !email || !password) {
    return res.status(400).json({ message: "Faltan campos" });
  }

  const hashedPassword = await bcrypt.hash(password, 10);

  const query = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
  db.query(query, [user, email, hashedPassword], (err, result) => {
    if (err) {
      console.error("❌ Error al registrar:", err);
      return res.status(500).json({ message: "Error al registrar" });
    }
    console.log("✅ Usuario registrado:", user);
    return res.status(200).json({ message: "Usuario registrado correctamente" });
  });
});

// 🚀 Iniciar servidor
app.listen(app.get("port"), () => {
  console.log("✅ Servidor corriendo en puerto", app.get("port"));
});
