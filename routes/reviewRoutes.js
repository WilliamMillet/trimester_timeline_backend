const express = require('express');
const userController = require('../controllers/reviewController');
const router = express.Router()

router.post("/", userController.handleSignup);

module.exports = router;

