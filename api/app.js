const express = require('express');
const bodyParser = require('body-parser');
const router = express.Router();
const app = express();
const port = process.env.PORT || 3001;
const advisers = require('./routes/advisers')(router);
const students = require('./routes/students')(router);
const papers = require('./routes/papers')(router);
const cors = require('cors');

app.use(cors({
    origin: 'http://localhost:3000'
}));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use('/advisers', advisers);
app.use('/students', students);
app.use('/papers', papers);

app.listen(port, () => {
  console.log('Listening to port: '+ port);
})
