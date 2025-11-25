document.addEventListener("DOMContentLoaded", () => {
  const grid = document.getElementById("product-grid");
  const cartDrawer = document.getElementById("cart-drawer");
  const cartOpen = document.getElementById("cart-open");
  const cartClose = document.getElementById("cart-close");
  const cartList = document.getElementById("cart-list");
  const cartCount = document.getElementById("cart-count");
  const cartTotal = document.getElementById("cart-total");

  let cart = [];
  let productos = [];

  // 🔥 1. Cargar productos desde tu servidor Node
  async function cargarProductos() {
    try {
      const res = await fetch("http://localhost:4000/api/productos");
      productos = await res.json();
      renderProductos();
    } catch (error) {
      console.error("Error al cargar productos:", error);
    }
  }

  // 🔹 2. Renderizar productos
  function renderProductos() {
    grid.innerHTML = "";
    productos.forEach(p => {
      const card = document.createElement("div");
      card.className = "card";
      card.innerHTML = `
        <img src="${p.imagen}" alt="${p.nombre}">
        <h3>${p.nombre}</h3>
        <p>${p.descripcion}</p>
        <div class="price">$${Number(p.precio).toLocaleString()}</div>
        <button class="btn" data-id="${p.id}">Agregar al carrito</button>
      `;
      grid.appendChild(card);
    });
  }

  cargarProductos(); // ⬅️ Carga productos reales

  // 🔹 3. Agregar al carrito
  grid.addEventListener("click", (e) => {
    if (e.target.matches(".btn")) {
      const id = parseInt(e.target.dataset.id);
      const producto = productos.find(p => p.id === id);
      const item = cart.find(p => p.id === id);

      if (item) {
        item.qty++;
      } else {
        cart.push({ ...producto, qty: 1 });
      }
      renderCart();
    }
  });

  cartOpen.addEventListener("click", () => cartDrawer.classList.add("open"));
  cartClose.addEventListener("click", () => cartDrawer.classList.remove("open"));

  // 🔹 4. Renderizar carrito
  function renderCart() {
    cartList.innerHTML = "";
    let total = 0;

    cart.forEach(p => {
      total += p.precio * p.qty;
      const li = document.createElement("li");
      li.textContent = `${p.nombre} x${p.qty} — $${(p.precio * p.qty).toLocaleString()}`;
      cartList.appendChild(li);
    });

    cartTotal.textContent = `$${total.toLocaleString()}`;
    cartCount.textContent = cart.reduce((sum, p) => sum + p.qty, 0);
  }
});
