const express = require('express');
const reviewController = require('../controllers/reviewController');
const router = express.Router()

router.post("/", reviewController.postReview);
// router.delete('/:id', reviewController.deleteReview)
router.get('/assignment/:id', reviewController.getReviewsByAssignment) // Get the reviews for an assignemnt with a given id

module.exports = router;

