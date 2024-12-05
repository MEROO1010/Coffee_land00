const express = require('express');
const path = require('path');

const app = express();

// Serve splash screen and onboarding resources
app.use('/assets', express.static(path.join(__dirname, 'assets')));

// API endpoint for fetching onboarding content (if dynamic)
app.get('/api/onboarding-content', (req, res) => {
  res.json({
    screens: [
      {
        title: "Welcome to CoffeeLand",
        description: "Discover the best coffee blends from around the world.",
        image: "/assets/onboarding1.png", // Replace with your image path
      },
      {
        title: "Brew Your Coffee",
        description: "Get brewing tips and tricks from experts.",
        image: "/assets/onboarding2.png",
      },
    ],
  });
});

// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
