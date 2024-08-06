// c

const db = require('../database/connect')
require('dotenv').config()
console.log("In mdoel line 3")
class User{
    constructor(entryObject){
        console.log("In line 6 constructor model")
        this.user_id = entryObject.user_id
        this.role=entryObject.role
        this.first_name = entryObject.first_name
        this.last_name = entryObject.last_name
        this.email = entryObject.email
        this.username = entryObject.username
        this.password = entryObject.password
        this.created_at = entryObject.created_at
    }

    //static async showAll(){
        //console.log("In show ALL in Model")
        //console.log("In Showall function  line 14")
        //const response = await db.query('SELECT * FROM diary_entries;')
        //if (response.rows.length === 0){
            //throw new Error("Table in database has no Entries")
        //} 
        //return response.rows.map(item => new Entry(item))
    //}//

    static async showOneUserEntry(data){
        const first_name= data["first name"].toLowerCase()
        const last_name= data["last name"].toLowerCase()
        const response = await db.query('SELECT * FROM users WHERE LOWER(first_name)=$1 AND LOWER(last_name)=$2;', [first_name, last_name])
        console.log("This is response in Model, in create: ", response)
        if (response.rows.length !== 1){
            throw new Error("User details are not in table i.e. cannot find username in users table.")
        } 
        return new User(response.rows[0])
    }

    static async createRegister(data){
        console.log("Increate in model")
        const role= data.role
        const first_name = data["first name"]
        const last_name = data["last name"]
        const email = data.email
        const username = data.username
        const password = data.password
        console.log("In create in Model")
        const response = await db.query('INSERT INTO users (role, first_name, last_name, email, username, password) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *;', [role, first_name, last_name,email, username, password])
        console.log("This is response in Model, in create: ", response)
        if (response.rows.length !== 1){
            throw new Error("User entry already exists.")
        } 
        return new User(response.rows[0])
    }

    /*async update(data){
       const id= this.id
        const description = data.description
        console.log("Object in update in model", this)
        console.log("In create in Model")
        const response = await db.query('UPDATE diary_entries SET description=$1 WHERE id=$2 RETURNING *;', [description, id])
        console.log("This is response in Model, in update: ", response)
        if (response.rows.length !== 1){
            throw new Error("Diary entry does not exist, unable to update.")
        } 
        return new Entry(response.rows[0])
    }

    async delete(){
        const id= this.id
        const response = await db.query('DELETE FROM diary_entries WHERE id=$1 RETURNING *;', [id])
        return new Entry(response.rows[0])
    }*/

}

module.exports = User