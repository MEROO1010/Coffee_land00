const express = require('express');
const path = require('path');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Serve static files
app.use('/assets', express.static(path.join(__dirname, 'assets')));

// Mock users for login
const mockUsers = [
  { username: 'user1', password: 'password123' },
  { username: 'user2', password: 'password456' },
];

// Dummy database for registration
const users = [];

// Onboarding content API
app.get('/api/onboarding-content', (req, res) => {
  res.json({
    screens: [
      {
        title: "Welcome to CoffeeLand",
        description: "Discover the best coffee blends from around the world.",
        image: "/assets/onboarding1.png",
      },
      {
        title: "Brew Your Coffee",
        description: "Get brewing tips and tricks from experts.",
        image: "/assets/onboarding2.png",
      },
    ],
  });
});

// Login endpoint
app.post('/api/login', (req, res) => {
  const { username, password } = req.body;

  // Validate user credentials
  const user = mockUsers.find(
    (u) => u.username === username && u.password === password
  );

  if (user) {
    return res.status(200).json({ message: 'Login successful' });
  } else {
    return res.status(401).json({ message: 'Invalid username or password' });
  }
});

// Registration endpoint
app.post('/api/register', (req, res) => {
  const { name, email, password } = req.body;

  // Basic validation
  if (!name || !email || !password) {
    return res.status(400).json({ message: 'All fields are required!' });
  }

  // Check for existing user
  const userExists = users.find((user) => user.email === email);
  if (userExists) {
    return res.status(400).json({ message: 'User already exists!' });
  }

  // Save the new user
  users.push({ name, email, password });
  res.status(201).json({ message: 'User registered successfully!' });
});

// Error-handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ message: 'Internal server error!' });
});

// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
