const database = require('../database');
module.exports = (router) => {

  router.get('/viewAdvisers', (req,res) => {
    let string_query = `
      SELECT
        A.*,
        GROUP_CONCAT(' ', field_of_mastery) AS field_mastery
      FROM
        adviser A NATURAL JOIN
        adviser_mastery
      GROUP BY
        employee_number`;

    database.query(string_query, (request,result) => {
      res.json(result);
    });
  });

  router.get('/getAdvisers', (req, res) => {
    let string_query = `
      SELECT
        employee_number,
        CONCAT(last_name, ', ', first_name, ' ', middle_name) AS name
      FROM
        adviser
      ORDER BY
        name;`;

    database.query(string_query, (request,result) => {
      res.json(result);
    });
  });

  router.post('/addAdviser', (req, res) => {
    console.log(req.body);
    if(!req.body || req.body == {} || req.body == null){
      res.json({'success': false, 'message': 'No data passed.'});
    }else{
      let string_query = `
        INSERT INTO
          adviser
        VALUES (
          '${req.body.employee_number}',
          '${req.body.last_name}',
          '${req.body.first_name}',
          '${req.body.middle_name}',
          '${req.body.college}',
          '${req.body.department}'); `;

      string_query += req.body.mastery.map(mastery => `INSERT INTO adviser_mastery VALUES('${req.body.employee_number}', '${mastery}'); `).join(' ');

      database.query(string_query, (error, result) => {
        if (error) res.json({'status': false});
        else console.log(result);
        res.json({ 'success': true, 'message' : 'Adviser added!' });
      });
    }
  });

  router.get('/getAdviserMastery', (req, res) => {
    var string_query = `
      SELECT
        field_of_mastery
      FROM
        adviser_mastery
      GROUP BY
        field_of_mastery
      ORDER BY
        field_of_mastery`;
    database.query(string_query, (request,result) => {
      res.json(result);
    });
  });

  router.post('/deleteAdviser/:id', (req, res) =>{
    let empnum = req.params.id;
    let string_query = `
      DELETE FROM
        co_authored_by_adviser
      WHERE
        employee_number= '${empnum}';

      DELETE FROM
        co_authored_by_student
      WHERE
        student_number IN (
          SELECT
            student_number
          FROM
            student
          WHERE
            employee_number='${empnum}');

      DELETE FROM
        paper_panel
      WHERE
        call_number IN (
          SELECT
            call_number
          FROM
            paper_panel_adviser
          WHERE
            employee_number='${empnum}');

      DELETE FROM
        paper_panel_adviser
      WHERE
        employee_number='${empnum}';

      DELETE FROM
        paper
      WHERE
        student_number IN (
          SELECT
            student_number
          FROM
            student
          WHERE
            employee_number='${empnum}');

      DELETE FROM
        student_interest
      WHERE
        student_number IN (
          SELECT
            student_number
          FROM
            student
          WHERE
            employee_number='${empnum}');

      DELETE FROM
        student
      WHERE
        employee_number='${empnum}';

      DELETE FROM
        adviser_mastery
      WHERE
        employee_number='${empnum}';

      DELETE FROM
        adviser
      WHERE
        employee_number='${empnum}';
    `;
    database.query(string_query, (error, result) => {
      if (error) res.json({'status': false});
      else res.json({'status': true});
    });
  });

  router.get('/searchAdviser/:field/:input', (req, res) =>{
    console.log(req.params);
    let string_query = `SELECT A.*, GROUP_CONCAT(' ', field_of_mastery) field_mastery FROM adviser A NATURAL JOIN adviser_mastery WHERE ${req.params.field} LIKE LOWER('%${req.params.input}%') GROUP BY employee_number`;
    database.query(string_query, (request, result) => {
      res.json(result);
    });
  });

  router.post('/updateAdviser', (req, res) => {
    const { employee_number, last_name, first_name, middle_name, college, department, mastery } = req.body;

    let string_query = `UPDATE adviser SET last_name='${last_name}', first_name='${first_name}', middle_name='${middle_name}', college='${college}', department='${department}' WHERE employee_number='${employee_number}'; `;

    string_query += `DELETE FROM adviser_mastery WHERE employee_number='${employee_number}'; `;
    string_query += mastery.map(mastery => `INSERT INTO adviser_mastery VALUES('${employee_number}', '${mastery}'); `).join(' ');

    console.log(string_query);

    database.query(string_query, (error, result) => {
      if (error) res.json({'status': false});
      else console.log(result);
      res.json({ 'success': true, 'message' : 'Adviser added!' });
    });
  });

  return router;
}
