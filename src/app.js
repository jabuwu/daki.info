const express = require('express');
const app = express();
app.use((_req, res) => {
  res.redirect('https://docs.google.com/document/d/1oIlLt1uqutTP8725wezfZ2mjc-IPfOFCdc6hlRIb-KM/edit');
});
module.exports = { app };