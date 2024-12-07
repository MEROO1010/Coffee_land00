const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());

const mockUsers = [
  { username: 'user1', password: 'password123' },
  { username: 'user2', password: 'password456' },
];

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

// Login Endpoint
app.post('/api/login', (req, res) => {
  const { username, password } = req.body;

  const user = mockUsers.find(
    (u) => u.username === username && u.password === password
  );

  if (user) {
    res.status(200).json({ message: 'Login successful' });
  } else {
    res.status(401).json({ message: 'Invalid username or password' });
  }
});


// Middleware
app.use(cors());
app.use(bodyParser.json());

// Dummy Database
const users = [];

// User Registration Endpoint
app.post('/api/register', (req, res) => {
  const { name, email, password } = req.body;

  // Simple validation
  if (!name || !email || !password) {
    return res.status(400).json({ message: 'All fields are required!' });
  }

  // Check if the user already exists
  const userExists = users.find(user => user.email === email);
  if (userExists) {
    return res.status(400).json({ message: 'User already exists!' });
  }

  // Save the user
  users.push({ name, email, password });
  res.status(201).json({ message: 'User registered successfully!' });
});



// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

