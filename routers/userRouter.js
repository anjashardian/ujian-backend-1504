// import router from express
const router = require('express').Router()
const { body } = require('express-validator')

// import controller
const { userController } = require('../controllers')

// import helpers
const { verifyToken } = require('../helpers/jwt')

// register validation
const registerValidation = [
    body('username')
        .notEmpty()
        .withMessage('Username can\'t empty')
        .isLength({ min: 6 })
        .withMessage('Username must have 6 character'),
    body('password')
        .notEmpty()
        .withMessage('Password can\'t empty')
        .isLength({ min: 6 })
        .withMessage('Password must have 6 character')
        .matches(/[0-9]/)
        .withMessage('Password must include number')
        .matches(/[!@#$%^&*]/)
        .withMessage('Password must include symbol'),
    body('email')
        .isEmail()
        .withMessage('Invalid email')
]

// edit validition
const editValidation = [
    body('username', 'Username must have 6 character')
        .isLength({ min: 6 }),
    body('email', 'Invalid email')
        .isEmail()
]

// edit password validation
const editPassValidation = [
    body('password')
        .notEmpty()
        .withMessage('Password can\'t empty')
        .isLength({ min: 6 })
        .withMessage('Password must have 6 character')
        .matches(/[0-9]/)
        .withMessage('Password must include number')
        .matches(/[!@#$%^&*]/)
        .withMessage('Password must include symbol')
]

// create router
router.post('/login', userController.login)
router.post('/register', registerValidation, userController.register)
router.patch('/edit/:id', editValidation, userController.edit)
router.patch('/deactive',  userController.deactiveAcc)
router.patch('/activate',  userController.deactiveAcc)


// export router
module.exports = router