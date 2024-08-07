const db = require("../database/connect");

class User {
  constructor({
    user_id,
    role,
    first_name,
    last_name,
    email,
    username,
    password,
  }) {
    this.id = user_id;
    this.role = role;
    this.first_name = first_name;
    this.last_name = last_name;
    this.email = email;
    this.username = username;
    this.password = password;
  }
  // static async getOneById(id) {
  //   const response = await db.query("SELECT * FROM users WHERE user_id = $1", [
  //     id,
  //   ]);
  //   if (response.rows.length != 1) {
  //     throw new Error("Unable to locate user by ID.");
  //   }
  //   return new User(response.rows[0]);
  // }

  static async getOneByUsername(username) {
    const response = await db.query("SELECT * FROM users WHERE username = $1", [
      username,
    ]);
    if (response.rows.length != 1) {
      throw new Error("Unable to locate user.");
    }
    return new User(response.rows[0]);
  }

  static async create(data) {
    const {
      role = "Student",
      first_name,
      last_name,
      email,
      username,
      password,
    } = data;
    let response = await db.query(
      "INSERT INTO users (role, first_name, last_name, email, username, password) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *;",
      [role, first_name, last_name, email, username, password]
    );
    // const newId = response.rows[0].user_id;
    // const newUser = await User.getOneById(newId);
    if (response.rows.length !== 1) {
      throw new Error(" Result entry already exists.");
    }
    return new User(response.rows[0]);
    // return newUser;
  }
}

module.exports = User;
