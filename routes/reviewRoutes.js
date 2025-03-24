const express = require('express');
const userController = require('../controllers/reviewController');
const router = express.Router()

router.post("/", userController.handleSignup);
router.delete('/:id', reviewController.deleteReview)
router.get('/assignment/:id', reviewController.getReviewsByAssignment) // Get the reviews for an assignemnt with a given id

module.exports = router;

