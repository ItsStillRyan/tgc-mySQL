const express = require("express");
const hbs = require("hbs");
const wax = require("wax-on");
const mysql = require("mysql2/promise");

let app = express();
app.set("view engine", "hbs");
app.use(express.static("public"));
wax.on(hbs.handlebars);
wax.setLayoutPath("./views/layouts");

app.use(express.urlencoded({ extended: false }));

async function main() {
    //connect to SQL
    const connection = await mysql.createConnection({
        //host usually is the web address of DB
        'host': 'localhost',
        'user': 'root',
        'database': 'sakila'
    })


    //START OF CRUD OF STRONG ENTITY

    //DISPLAY
    app.get('/actors', async (req, res) => {
        let [actors] = await connection.execute("SELECT * FROM actor");
        res.render('actors', {
            'actors': actors
        })
    })

    //CREATE
    app.get('/actors/create', async (req, res) => {
        res.render('actor_create')
    })

    app.post('/actors/create', async (req, res) => {
        let { first_name, last_name } = req.body
        //instead of long-windded
        //let first_name = req.body.first_name
        //let last_name = req.body.last_name
    })

    //UPDATE
    app.get('/actors/:actor_id/update', async (req, res) => {
        //retreieve data that you want to update
        let query = "SELECT * FROM actor WHERE actor_id = ?";
        let [actors] = await connection.execute(query, [req.params.actor_id])
        let actor = actors[0]
        //render the form
        res.render('actor_update', {
            'actor': actor
        })
    })

    app.post('/actors/:actor_id/update', async (req, res) => {
        let { first_name, last_name } = req.body

        const query = "UPDATE actor SET first_name=?, last_name=? WHERE actor_id = ?";
        await connection.execute(query, [first_name, last_name, req.params.actor_id])
        res.redirect('/actors')
    })


    //DELETE
    app.get('/actors/:actor_id/delete', async (req, res) => {
        let query = "SELECT * FROM actor WHERE actor_id = ?";
        let [actors] = await connection.execute(query, [req.params.actor_id])
        let actor = actors[0]

        res.render('actor_delete', {
            'actor': actor
        })
    })

    app.post('/actors/:actor_id/delete', async (req, res) => {
        let query = "DELETE FROM actor WHERE actor_id = ?"
        await connection.execute(query, [req.params.actor_id])
        res.redirect('/actors')
    })


    //END OF CRUD OF STRONG ENTITY


    //START OF CRUD OF WEAK ENTITY

    //DISPLAY FILM
    app.get('/films', async (req, res) => {
        let query = `SELECT * FROM film JOIN language ON film.language_id = language.language_id WHERE 1`
        const [film] = await connection.execute(query);
        res.render('film', {
            'film': film
        })
    })

    //CREATE FILM
    app.get('/films/create', async (req, res) => {
        let [languages] = await connection.execute("SELECT * from language");

        res.render('film_create', {
            'languages': languages
        })
    })

    app.post('/films/create', async (req, res) => {
        let query = `INSERT INTO film (title, description, release_year, original_language_id, 
            language_id, rental_duration, rental_rate,
            length, replacement_cost) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`;

        await connection.execute(query, [
            req.body.title,
            req.body.description,
            req.body.release_year,
            req.body.original_language_id,
            req.body.language_id,
            req.body.rental_duration,
            req.body.rental_rate,
            req.body.length,
            req.body.replacement_cost
        ])

        res.send("New film has been added");
    })


    //UPDATE FILM
    app.get('/films/:film_id/update', async (req, res) => {
        // 1. fetch the film first
        const query = "SELECT * FROM film WHERE film_id = ?";
        let [films] = await connection.execute(query, [req.params.film_id]);
        let film = films[0];

        // 2. fetch all the languages
        let [languages] = await connection.execute("SELECT * from language");

        res.render('film_update', {
            'film': film,
            'languages': languages
        })

    })

    app.post('/films/:film_id/update', async (req, res) => {
        let query = `UPDATE film
            SET title=?, description=?, release_year=?, original_language_id=?, 
            language_id=?, rental_duration=?, rental_rate=?,
            length=?, replacement_cost=? WHERE film_id = ?`;

        await connection.execute(query, [
            req.body.title,
            req.body.description,
            req.body.release_year,
            req.body.original_language_id,
            req.body.language_id,
            req.body.rental_duration,
            req.body.rental_rate,
            req.body.length,
            req.body.replacement_cost,
            req.params.film_id
        ])

        res.send("New film has been added");
    })



    //END OF CRUD OF WEAK ENTITY

    //START OF SEARCH FILTER/ENGINE


    //END OF SEARCH FILTER/ENGINE
}
main()


require("handlebars-helpers")({
    handlebars: hbs.handlebars,
});

// ROUTES BEGIN HERE


app.listen(3000, () => {
    console.log("Server started");
});