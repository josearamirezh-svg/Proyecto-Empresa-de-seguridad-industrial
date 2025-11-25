// /app/server.js
import express from "express";
import cors from "cors";
import path from "path";
import { fileURLToPath } from "url";
import userRoutes from "./routes/product.routes.js";

const app = express();
app.use(cors());
app.use(express.json());

// Configuración de rutas y archivos estáticos
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

app.use(express.static(path.join(__dirname, "public")));
app.use("/api", userRoutes);

// Servir páginas HTML directamente
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "pages", "home.html"));
});

const PORT = 4000;
app.listen(PORT, () => console.log(`✅ Servidor activo en http://localhost:${PORT}`));
