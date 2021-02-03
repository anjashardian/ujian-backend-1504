const { validationResult, check } = require('express-validator')
const cryptojs = require('crypto-js')

const { generateQuery, asyncQuery } = require('../helpers/queryHelp')
const { createToken } = require('../helpers/jwt')

// import database connection
const db = require('../database')

// import dotenv
const SECRET_KEY = process.env.CRYPTO_KEY

//export controller
module.exports = {
   login: (req, res) => {
      const { username, password } = req.body

      // hashing password
      const hashpass = cryptojs.HmacMD5(password, SECRET_KEY)

      const loginQuery = `SELECT id,uid, username, email, status, role FROM users
                        WHERE (username= ${db.escape(username)}
                        AND password = ${db.escape(hashpass.toString())})
                        OR (email= ${db.escape(email)}
                        AND password = ${db.escape(hasspass.tostring())})`
      // console.log(loginQuery)

      db.query(loginQuery, (err, result) => {
          if (err) return res.status(500).send(err)

          // result bentuknya array of object
          // console.log(result)

          // cek apakah login berhasil
          if (result.length === 0) return res.status(400).send('Username or Password is wrong')

          // create token
          let token = createToken({ id: result[0].id_users, username: result[0].username })

          // console.log(result[0])

          // input token to result
          result[0].token = token

          // console.log(result[0])

          res.status(200).send(result[0])
      })
      // res.status(200).send('testing login')
  },
   register: async (req, res) => {
       const {username, password, email} = req.body

         // validation input from user
         const errors = validationResult(req)
         if (!errors.isEmpty()) return res.status(400).send(errors.array()[0].msg)
 
         const hashpass = cryptojs.HmacMD5(password, SECRET_KEY)

         try{

            const checkUser = `SELECT * FROM users
            WHERE username = ${db,escape(username)}
            OR email =${db.escape(email)}`

            const resCheck = await asyncQuery(checkUser)

            if (resCheck.length !== 0) return res.status(400).send('Username or Email is already exist')

            const regQuery = `INSERT INTO users(uid, username, password, email)
                            VALUES (${db.escape(Date.now())}, ${db.escape(username)}, ${db.escape(hashpass.toString())}, ${db.escape(email)})`

            const resRegister = await asyncQuery(regQuery)
            console.log(resRegister)

            const userQuery = `SELECT * FROM users WHERE = ${db.escape(username)}`
            db.query(userQuery, (err, result) => {
                if(err) return res.status(500).send(err)

                const token = createToken({uid: result[0].uid, role:result[0].role})

                result [0].token = token

                res.status(200).send(result[0])
            })
         }
         catch(err){
            console.log(err)
            res.status(400).send(err)
         }
   },
   deactiveAcc: async (req, res) => {
     
      try{
         const getUser = `SELECT * FROM users
         WHERE uid= ${req.user.uid}`

      const result = await asyncQuery(getUser)

      const editStatus = `UPDATE users SET status = 2 WHERE uid= ${req.user.uid}`
      const result1 = await asyncQuery(editStatus)

      res.status(200).send(result[0])

      }
      catch(err){
         console.log(err)
         res.status(400).send(err)
      }
   },

   edit: (req, res) =>{
      const id = parseInt(req.params.id)

      const errors= validationResult(req)

      const errUsername = errors.errors.filter(item => item.param === 'username' && item.value !== undefined)
      if(errUsername.length !== 0) return res.status(400).send(errUsername[0].msg)

      const errEmail = errors.errors.filter(item => item.param === 'email' && item.value !== undefined)
      if(errEmail.length !== 0) return res.status(400).send(errEmail[0].msg)

   },
   activateAcc: async (req, res) =>{
     
   try{
      const getUser = `select uid from users
      where uid= ${req.user.uid}`

      const result = await asyncQuery(getUser)

      const editStatus = `update users set status = 1 where uid=${req.user.uid}`
      const result2 = await asyncQuery(editStatus)

      let status = 'active'
      result[0].status= status
      
      res.status(200).send(result[0])
   
   }
   catch(err){
      console.log(err)
      res.status(400).send(err)
   }
   }
}