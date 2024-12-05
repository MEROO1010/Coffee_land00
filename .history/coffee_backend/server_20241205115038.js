const express = require('express');
const multer = require('multer');
const path = require('path');
const cors = require('cors');

const app = express();
const PORT = 3000;

// Enable CORS for all requests
app.use(cors());

// Serve static files from the uploads directory
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

// In-memory storage of splash data (can be replaced with a database)
const splashData = {
  title: 'Coffee',
  subtitle: 'Land',
  logo_image: 'http://localhost:3000/uploads/logo.png', // Update after uploading
  background_image: 'http://localhost:3000/uploads/background.png' // Update after uploading
};

// Endpoint to get splash screen data
app.get('/api/splash', (req, res) => {
  res.json(splashData);
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
