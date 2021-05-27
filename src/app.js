const express = require('express');
const app = express();
app.get('/survey', (_req, res) => {
  res.redirect('https://docs.google.com/spreadsheets/d/1yvjI3EQmvhkN4q5PBlJwjyeLbLpNC-QIpVWq5Xn7cB8/edit?usp=sharing');
});
app.use((_req, res) => {
  res.redirect('https://docs.google.com/document/d/1oIlLt1uqutTP8725wezfZ2mjc-IPfOFCdc6hlRIb-KM/edit');
});
module.exports = { app };