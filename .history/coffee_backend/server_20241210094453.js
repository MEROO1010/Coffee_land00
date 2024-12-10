const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const authRoutes = require('./auth'); // Import the auth routes

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(bodyParser.json());

app.use('/api', authRoutes); // Use the auth routes

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});