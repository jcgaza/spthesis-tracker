const database = require('../database');
module.exports = (router) => {

  router.get('/viewStudents', (req,res) => {
    var string_query =
      `SELECT A.*, CONCAT(B.last_name, ', ', B.first_name, ' ', B.middle_name) Adviser, GROUP_CONCAT(' ', C.field_of_interest) interest FROM student A, adviser B, student_interest C WHERE A.employee_number = B.employee_number AND A.student_number = C.student_number GROUP BY A.student_number;`;
    database.query(string_query, (request,result) => {
      res.json(result);
    });
  });

  router.get('/getStudents', (req, res) => {
    let string_query = `SELECT student_number, CONCAT(last_name, ', ', first_name, ' ', middle_name) name FROM student ORDER BY name;`;

    database.query(string_query, (request,result) => {
      res.json(result);
    });
  });

  router.post('/addStudent', (req, res) => {
    console.log(req.body);
    if(!req.body || req.body == {} || req.body == null){
      res.json({'success': false, 'message': 'No data passed.'});
    }else{
      let string_query = `INSERT INTO student VALUES ('${req.body.student_number}', '${req.body.last_name}', '${req.body.first_name}', '${req.body.middle_name}', '${req.body.course}', '${req.body.employee_number}'); `;

      string_query += req.body.interest.map(interest => `INSERT INTO student_interest VALUES ('${req.body.student_number}', '${interest}'); `).join(" ");

      console.log(string_query);

      database.query(string_query, (error, result) => {
        if (error) res.json({'success': false, 'message': 'Student not added.'});
        else console.log(result);
        res.json({'success': true, 'message': 'Student added.'});
      });
    };

  });

  router.post('/deleteStudent/:id', (req, res) =>{
    let studnum = req.params.id;
    let string_query = `
      DELETE FROM co_authored_by_student WHERE student_number='${studnum}';
      DELETE FROM co_authored_by_adviser WHERE call_number IN (SELECT call_number FROM paper WHERE student_number='${studnum}');
      DELETE FROM paper_panel WHERE call_number IN (SELECT call_number FROM paper WHERE student_number='${studnum}');
      DELETE FROM paper_panel_adviser WHERE call_number IN (SELECT call_number FROM paper WHERE student_number='${studnum}');
      DELETE FROM paper_interest WHERE call_number IN (SELECT call_number FROM paper WHERE student_number='${studnum}');
      DELETE FROM paper WHERE student_number='${studnum}';
      DELETE FROM student_interest WHERE student_number='${studnum}';
      DELETE FROM student WHERE student_number='${studnum}';
    `;
    database.query(string_query, (error, result) => {
      if (error) res.json({'status': false});
      else console.log(result);
      res.json({'status': true});
    });
  });

  router.get('/getStudentInterest', (req, res) => {
    var string_query = `SELECT field_of_interest FROM student_interest GROUP BY field_of_interest ORDER BY field_of_interest`;
    database.query(string_query, (request,result) => {
      console.log(result);
      res.json(result);
    });
  });

  router.post('/updateStudent', (req, res) => {
    let string_query = `UPDATE student SET last_name='${req.body.last_name}', first_name='${req.body.first_name}', middle_name='${req.body.middle_name}', course='${req.body.course}', employee_number='${req.body.employee_number}' WHERE student_number='${req.body.student_number}'; `;

    string_query += `DELETE FROM student_interest WHERE student_number='${req.body.student_number}'; `;

    string_query += req.body.interest.map(interest => `INSERT INTO student_interest VALUES ('${req.body.student_number}', '${interest}'); `).join(' ');

    console.log(string_query);

    database.query(string_query, (error, result) => {
      if (error) res.json({'status': false});
      else res.json({ 'success': true, 'message' : 'Adviser added!' });
    });
  });

  router.get('/searchStudent/:field/:input', (req, res) =>{
    console.log(req.params);
    let string_query = `SELECT A.*, CONCAT(B.last_name, ', ', B.first_name, ' ', B.middle_name) Adviser, GROUP_CONCAT(' ', C.field_of_interest) interest FROM student A, adviser B, student_interest C WHERE A.employee_number = B.employee_number AND A.student_number = C.student_number AND A.${req.params.field} LIKE LOWER('%${req.params.input}%') GROUP BY A.student_number;`

    database.query(string_query, (request, result) => {
      res.json(result);
    });
  });

  return router;
}
