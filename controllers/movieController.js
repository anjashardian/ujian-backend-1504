const { validationResult, check } = require('express-validator')
const cryptojs = require('crypto-js')

const { generateQuery, asyncQuery } = require('../helpers/queryHelp')
const { createToken } = require('../helpers/jwt')

// import database connection
const db = require('../database')

// import dotenv
const SECRET_KEY = process.env.CRYPTO_KEY

module.exports = {
 getMovie: (req, res) =>{
     const userQuery = `select c1.name, c1.release_date, c1.release_month, c1.release_year, c1.duration, c1.genre, c1.description, c2.status,c4.location,c5.time from movies c1
     left join movie_status c2 
     on c1.status = c2.id
     left join schedules c3
     on c1.id = c3.movie_id
     left join location c4
     on c3.location_id = c4.id
     left join show times c5
     on c3.time_id = c5.id`
     db.query(userQuery), (err, result) => {
         if(err) return res.status(500).send(err)

         res.status(200).send(result)
     }
 },
 getMovieStatus:(req, status) =>{
     let reqMovie = req.query('status')
     const userQuery = `select c1.name, c1.release_date, c1.release_mounth, c1.release_year, c1.duration, c1.genre, c1.description, c2.status,c4.location,c5.time from movies c1
     left join movie_status c2 
     on c1.status = c2.id
     left join schedules c3
     on c1.id = c3.movie_id
     left join location c4
     on c3.location_id = c4.id
     left join show times c5
     on c3.time_id = c5.id
     where c2.status = ${db.escape(req.query.status)}
     and c4.location = ${db.escape(req.query.location)}
     and c5.time = ${db.escape(req.query.time)} c2.status = ${db.escape(req.query.status)}
     or c4.location= ${db.escape(req.query.location)}
     or c5.time= ${db.escape(req.query.time)}`
     
     const checkUser = `select # from users where id_users=${db.escape(parseInt(req.params.id))}`
     
     db.query(userQuery, (err, result) => {
         if (err) return res.status(500).send(err)

         res.status(200).send(result)
     })
 },

}