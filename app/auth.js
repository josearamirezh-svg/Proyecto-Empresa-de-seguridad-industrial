// Simple login validation
document.addEventListener("DOMContentLoaded", function () {
    const loginForm = document.getElementById("loginForm");
    if (loginForm) {
      loginForm.addEventListener("submit", function (e) {
        e.preventDefault();
        const username = document.getElementById("username").value;
        const password = document.getElementById("password").value;
        if (username === "admin" && password === "admin123") {
          window.location.href = "register.html"; // Redirect after login
        } else {
          alert("Invalid login!");
        }
      });
    }
  
    const registerForm = document.getElementById("registerForm");
    if (registerForm) {
      registerForm.addEventListener("submit", function (e) {
        e.preventDefault();
        const student = {
          nic: document.getElementById("nic").value,
          name: document.getElementById("name").value,
          address: document.getElementById("address").value,
          tel: document.getElementById("tel").value,
          course: document.getElementById("course").value
        };
  
        let students = JSON.parse(localStorage.getItem("students")) || [];
        students.push(student);
        localStorage.setItem("students", JSON.stringify(students));
        alert("Student registered successfully!");
        registerForm.reset();
      });
    }
  });
  