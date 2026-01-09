import express from 'express';
import pool from './db';
const app = express();
const cors = require('cors');
const port = 3000;
app.use(cors());

app.get('/', (req, res) => {
  res.send('Hello from Docker!');
});

app.listen(port, () => console.log(`App listening on port ${port}`));
app.get('/api/status', (req, res) => {
  res.json({ status: 'Backend is connected!' });
});

app.get('/users', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM users');
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send('Database Error');
  }
});