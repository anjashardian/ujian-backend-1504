const express = require('express')
const cors = require('cors')
const bodyparser = require('body-parser')
require('dotenv').config()


// main app
const app = express()

// apply middleware
app.use(cors())
app.use(bodyparser.json())

// import connection
const db = require('./database')

db.connect((err) => {
    // console.log(err)
    // console.log(connection)
    if (err) return console.log(`error connecting : ${err.stack}`)
    console.log(`connected as id : ${db.threadId}`)
})

// main route
const response = (req, res) => res.status(200).send('<h1>REST API JCWM1504</h1>')
app.get('/', response)

//import router

const { userRouter, movieRouter } = require('./routers')
app.use('/user', userRouter)
app.use('/movie', movieRouter)

// bind to local machine
const PORT = process.env.PORT || 2000
app.listen(PORT, () => `CONNECTED : port ${PORT}`)