const express = require('express')
const cors = require('cors')
require('dotenv').config()

// Configure base middleware

const app = express()

app.use(cors())
app.use(express.json())

const userRoutes = require('./routes/userRoutes')
const reviewRoutes = require('./routes/reviewRoutes')
const assignmentRoutes = require('./routes/assignmentRoutes')
const courseRoutes = require('./routes/courseRoutes')

app.use('/api/users', userRoutes)
app.use('/api/reviews', reviewRoutes)
app.use('/api/assignments', assignmentRoutes)
app.use('/api/courses', courseRoutes)

module.exports = app