const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');

const app = express();
const port = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// MongoDB Connection (Replace with your MongoDB URI)
mongoose.connect('mongodb://localhost/myDatabase', { useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => console.log('MongoDB Connected'))
    .catch(err => console.error(err));

// Define API Routes
app.get('/api/users', (req, res) => {
    // ...
});

app.post('/api/users', (req, res) => {
    // ...
});

// Start the Server
app.listen(port, () => {
    console.log(`Server started on port ${port}`);
});