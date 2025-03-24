const express = require('express');
const userController = require('../controllers/userController');
const router = express.Router()

router.post("/signup", userController.handleSignup);
router.get("/login", userController.handleLogin);
router.delete("/delete", userController.handleDeleteUser);

module.exports = router;

