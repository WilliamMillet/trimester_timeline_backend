const app = require('./app.js')
require('dotenv').config()

const port = process.env.PORT

app.listen(port, () => {
    `Server is listening on port ${port}`
})
