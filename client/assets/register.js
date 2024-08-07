document
  .getElementById("registerForm")
  .addEventListener("submit", async (e) => {
    e.preventDefault();

    const form = new FormData(e.target);

    const formData = {
      fullname: form.get("fullname"),
      email: form.get("email"),
      password: form.get("password"),
    };

    const options = {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        fullname: form.get("fullname"),
        email: form.get("email"),
        password: form.get("password"),
      }),
    };

    const response = await fetch(
      "http://localhost:3000/users/register",
      options
    );
    const data = await response.json();

    if (response.status == 201) {
      window.location.assign("login.html");
    } else {
      alert(data.error || "Registration failed. Please try again.");
    }
  });
