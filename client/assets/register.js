document
  .getElementById("registerForm")
  .addEventListener("submit", async (e) => {
    e.preventDefault();
    const form = new FormData(e.target);

    const options = {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        first_name: form.get("firstName"),
        last_name: form.get("lastName"),
        email: form.get("email"),
        username: form.get("username"),
        password: form.get("password"),
      }),
    };

    const response = await fetch("/users/register", options);
    const data = await response.json();

    if (response.status == 201) {
      window.location.assign("login.html");
    } else {
      alert(data.error || "Registration failed. Please try again.");
    }
  });
