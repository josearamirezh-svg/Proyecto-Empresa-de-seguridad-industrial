document.getElementById("loginForm").addEventListener("submit", async (e) => {
  e.preventDefault();

  const email = document.getElementById("email").value.trim();
  const password = document.getElementById("password").value.trim();

  try {
    const response = await fetch("http://localhost:4000/api/users/login", {
  method: "POST",
  headers: { "Content-Type": "application/json" },
  body: JSON.stringify({ email, password }),
});

    const data = await response.json();

    if (response.ok) {
      alert("✅ " + data.message);
      console.log("Usuario:", data.user);

      // Guardar sesión en localStorage
      localStorage.setItem("user", JSON.stringify(data.user));

      // Redirigir al menú o dashboard
      window.location.href = "admin";
    } else {
      alert("❌ " + data.message);
    }
  } catch (error) {
    console.error("Error en el login:", error);
    alert("No se pudo conectar con el servidor");
  }
});
