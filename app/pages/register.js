document.getElementById("register-form").addEventListener("submit", async (e) => {
  e.preventDefault();

  const username = document.getElementById("user").value;
  const email = document.getElementById("email").value;
  const password = document.getElementById("password").value;
  const confirmPassword = document.getElementById("password-confirm").value;

  if (password !== confirmPassword) {
    alert("Las contraseñas no coinciden");
    return;
  }

  try {
    const res = await fetch("/api/users/register", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ username, email, password }) // 👈 nombre correcto
    });

    const data = await res.json();
    if (res.ok) {
      alert("✅ Usuario registrado correctamente");
      window.location.href = "login.html";
    } else {
      alert("❌ Error en el registro: " + data.message);
    }
  } catch (err) {
    alert("❌ No se pudo conectar con el servidor");
    console.error("Error en el registro:", err);
  }
});
