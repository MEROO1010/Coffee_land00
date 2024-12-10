const express = require('express');
const bcrypt = require('bcrypt');
const router = express.Router();

// Mock database (replace with your actual database logic)
const users = [];

router.post('/signup', async (req, res) => {
  const { email, password } = req.body;

  // Check if user already exists
  const existingUser  = users.find(user => user.email === email);
  if (existingUser ) {
    return res.status(400).json({ message: 'User  already exists' });
  }

  // Hash the password
  const hashedPassword = await bcrypt.hash(password, 10);

  // Save the new user
  users.push({ email, password: hashedPassword });
  res.status(201).json({ message: 'User  registered successfully' });
});

module.exports = router;