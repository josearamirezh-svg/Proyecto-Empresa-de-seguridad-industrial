// menu.js
document.addEventListener("DOMContentLoaded", () => {
  const toggle = document.getElementById("menu-toggle");
  const navLinks = document.getElementById("nav-links");
  const icon = toggle.querySelector("i");

  toggle.addEventListener("click", () => {
    // Alterna la visibilidad del menú
    navLinks.classList.toggle("active");

    // Cambia el ícono del botón
    if (navLinks.classList.contains("active")) {
      icon.classList.remove("fa-bars");
      icon.classList.add("fa-times");
    } else {
      icon.classList.remove("fa-times");
      icon.classList.add("fa-bars");
    }
  });
});
