require('dotenv').config();
const express = require('express');
const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const cors = require('cors');
const bodyParser = require('body-parser');


const app = express();
app.use(express.json());
app.use(cors());

mongoose.connect(process.env.MONGO_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const userSchema = new mongoose.Schema({
  name: String,
  email: { type: String, unique: true },
  password: String,
});

const User = mongoose.model('User', userSchema);

// Route to handle sign-in
app.post('/signin', (req, res) => {
  const { username, password } = req.body;

  if (username === mockUser.username && password === mockUser.password) {
    res.json({ success: true, message: 'Sign-in successful!' });
  } else {
    res.status(401).json({ success: false, message: 'Invalid credentials' });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});


// In-memory storage for registered users (for demonstration purposes)
let users = [];

// Route to handle sign-up
app.post('/signup', (req, res) => {
  const { name, email, password } = req.body;

  // Check if the email is already registered
  const userExists = users.find(user => user.email === email);

  if (userExists) {
    return res.status(400).json({ success: false, message: 'Email is already registered' });
  }

  // Add the new user to the users array
  users.push({ name, email, password });
  res.json({ success: true, message: 'User registered successfully' });
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
