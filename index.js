const express = require('express')
const prisma = require('./lib/prisma');
const router = require('./routes/routes');
const PORT = 8000;
const app = express()
app.use(express.json())
app.use('/api', router)

app.listen(PORT, () => {
  console.log(PORT + " Server has been started...");
})