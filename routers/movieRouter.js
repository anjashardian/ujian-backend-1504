const router = require('express').Router()
const { body } = require('express-validator')

// import controller
const { movieController } = require('../controllers')


const regValodator= [

]


// create router
router.get('/get/all', movieController.getMovie)
router.post('/register', registerValidation, userController.register)