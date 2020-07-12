const mysql = require('mysql');

const database = mysql.createConnection({
  host      : 'localhost',
  user      : 'spt_tracker',
  password  : 'test',
  database  : 'spthesis',
  multipleStatements : true
});

database.connect(err => {
  if (err) throw err;
  else console.log('MySQL connected!');
});

database.query('USE spthesis');

module.exports = database;
