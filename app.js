const express = require('express')
const cors = require('cors')
require('dotenv').config()

// Configure base middleware

const app = express()

app.use(cors())
app.use(express.json())

const userRoutes = require('./routes/userRoutes')

app.use('/api/users', userRoutes)


app.use('/api/v1', v1Routes)

module.exports = app