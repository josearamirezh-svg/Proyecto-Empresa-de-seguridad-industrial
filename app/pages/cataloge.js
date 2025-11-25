document.addEventListener("DOMContentLoaded", function () {
  const grid = document.getElementById("product-grid");
  const url = "/api/productos";

  async function cargarProductos() {
    try {
      const res = await fetch(url);
      const productos = await res.json();

      grid.innerHTML = "";

      productos.forEach(p => {
        const card = document.createElement("div");
        card.className = "card";

        card.innerHTML = `
          <img src="${p.imagen || "https://via.placeholder.com/400x300"}" alt="${p.nombre}">
          <h3>${p.nombre}</h3>
          <div class="price">$${p.precio_unitario.toLocaleString()}</div>
        `;

        grid.appendChild(card);
      });

      document.getElementById("visible-count").textContent = productos.length;

    } catch (error) {
      console.error("Error cargando productos:", error);
    }
  }

  cargarProductos();
});
