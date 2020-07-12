const database = require('../database');
module.exports = (router) => {

  router.get('/viewPapers', (req,res) => {
    let string_query =
      `SELECT DISTINCT
        CONCAT(a.last_name, ", ", a.first_name, " ", a.middle_name) AS studname,
        CONCAT(b.last_name, ", ", b.first_name, " ", b.middle_name) AS advisername,
        c.call_number,
        title,
        classification,
        date_published,
        grade,
        isBest,
        isBestPoster,
        a.student_number AS studnum,
        b.employee_number AS empnum,
        GROUP_CONCAT(DISTINCT " ", c.employee_number) AS coauthor_advisers,
        GROUP_CONCAT(DISTINCT " ", e.student_number) AS coauthor_students,
        GROUP_CONCAT(DISTINCT ' ', g.employee_number) AS panelmem,
        h.presentation_date AS presdate,
        h.presentation_place AS presplace
      FROM student a JOIN
        adviser b
      ON a.employee_number = b.employee_number JOIN
        paper d
      ON d.student_number = a.student_number LEFT JOIN
        co_authored_by_adviser c
      ON d.call_number = c.call_number LEFT JOIN
        co_authored_by_student e
      ON e.call_number = d.call_number JOIN
        paper_panel_adviser g
      ON d.call_number = g.call_number JOIN
        paper_panel h
      ON h.call_number = d.call_number
      GROUP BY
        d.call_number; `;
    database.query(string_query, (request,result) => {
      res.json(result);
    });
  });

  router.get('/getCAStudents', (req, res) => {
    let string_query = `
      SELECT
        call_number,
        GROUP_CONCAT(' ', student_number) AS CAstud
      FROM
        co_authored_by_student
      GROUP BY
        call_number`;

    database.query(string_query, (request, result) => {
      res.json(result);
    });
  });

  router.post('/updatePaper', (req, res) => {
    let string_query = `
      UPDATE
        paper
      SET
        title='${req.body.title}',
        classification='${req.body.classification}',
        date_published='${req.body.date_published}',
        isBest=${req.body.isBest},
        isBestPoster=${req.body.isBestPoster},
        student_number='${req.body.student_number}'
      WHERE
        call_number='${req.body.call_number}';

      UPDATE
        paper_panel
      SET
        presentation_date='${req.body.presentation_date}',
        presentation_place='${req.body.presentation_place}'
      WHERE
        call_number='${req.body.call_number}'; `;

    string_query += `DELETE FROM paper_panel_adviser WHERE call_number='${req.body.call_number}'; DELETE FROM co_authored_by_adviser WHERE call_number='${req.body.call_number}'; DELETE FROM co_authored_by_student WHERE call_number='${req.body.call_number}'; `

    string_query += req.body.co_authors.students.map(student => `INSERT INTO co_authored_by_student VALUES('${req.body.call_number}', '${student}'); `).join(' ');

    string_query += req.body.co_authors.advisers.map(adviser => `INSERT INTO co_authored_by_adviser VALUES('${req.body.call_number}', '${adviser}'); `).join(' ');

    string_query += req.body.panel.map(panel => `INSERT paper_panel_adviser VALUES('${req.body.call_number}', '${panel}'); `).join(' ');

    console.log(string_query);

    database.query(string_query, (error, result) => {
      console.log(result);
      res.json({ 'success': true, 'message' : 'Adviser added!' });
    });

  });

  router.post('/addPaper', (req, res) => {
    if(!req.body || req.body === {} || req.body === null){
      res.json({'success': false, 'message': 'No data passed.'});
    }else{
      let string_query = `
        INSERT INTO
          paper
        VALUES (
          '${req.body.call_number}',
          '${req.body.title}',
          '${req.body.classification}',
          '${req.body.date_published}',
          ${req.body.grade},
          ${req.body.isBest},
          ${req.body.isBestPoster},
          '${req.body.student_number}'); `;

      string_query += req.body.co_authors.students.map(student => `INSERT INTO co_authored_by_student VALUES('${req.body.call_number}', '${student}'); `).join(' ');

      string_query += req.body.co_authors.advisers.map(adviser => `INSERT INTO co_authored_by_adviser VALUES('${req.body.call_number}', '${adviser}'); `).join(' ');

      string_query += req.body.panel.map(panel => `INSERT INTO paper_panel_adviser VALUES('${req.body.call_number}', '${panel}'); `).join(' ');

      string_query += `INSERT INTO paper_panel VALUES ('${req.body.call_number}', '${req.body.presentation_date}', '${req.body.presentation_place}'); `;

      console.log(string_query);

      database.query(string_query, req.body, (error, result) => {
        if (error) res.json({'success': false, 'message': 'paper not added.'});
        else console.log(result);
        res.json({'success': true, 'message': 'paper added.'});
      });
    }
  });

  router.get('/searchPapers/:field/:input', (req, res) =>{
    console.log(req.params);
    let string_query = `
      SELECT DISTINCT
        CONCAT(a.last_name, ", ", a.first_name, " ", a.middle_name) AS studname,
        CONCAT(b.last_name, ", ", b.first_name, " ", b.middle_name) AS advisername,
        c.call_number,
        title,
        classification,
        date_published,
        grade,
        isBest,
        isBestPoster,
        a.student_number AS studnum,
        b.employee_number AS empnum,
        GROUP_CONCAT(DISTINCT " ", c.employee_number) AS coauthor_advisers,
        GROUP_CONCAT(DISTINCT " ", e.student_number) AS coauthor_students,
        GROUP_CONCAT(DISTINCT ' ', g.employee_number) AS panelmem,
        h.presentation_date AS presdate,
        h.presentation_place AS presplace
      FROM student a JOIN
        adviser b
      ON a.employee_number = b.employee_number JOIN
        paper d
      ON d.student_number = a.student_number LEFT JOIN
        co_authored_by_adviser c
      ON d.call_number = c.call_number LEFT JOIN
        co_authored_by_student e
      ON e.call_number = d.call_number JOIN
        paper_panel_adviser g
      ON d.call_number = g.call_number JOIN
        paper_panel h
      ON h.call_number = d.call_number
      GROUP BY
        d.call_number
      HAVING `

    if (req.params.field === "employee_number") string_query += `empnum like '%${req.params.input}%'`;
    else if (req.params.field === "student_number") string_query += `studnum like '%${req.params.input}%'`;
    else if (req.params.field === "title") string_query += `title like '%${req.params.input}%'`;
    else if (req.params.field === "call_number") string_query += `c.call_number like '%${req.params.input}%'`;
    else if (req.params.field === 'studname') {
      string_query += ` studname LIKE '%${req.params.input}%' `;
    } else if (req.params.field === 'advisername') {
      string_query += ` advisername LIKE '%${req.params.input}%' `
    }

    console.log(string_query);

    database.query(string_query, (response, result) => {
      res.json(result);
    });
  });

  router.get('/advancedSearch/:field/:input/:sortOption/:sortBy/:isSP/:isThesis/:isBest/:isBestPoster/:panel/:students/:advisers', (req, res) => {
    let string_query =
      `SELECT DISTINCT
        CONCAT(a.last_name, ", ", a.first_name, " ", a.middle_name) AS studname,
        CONCAT(b.last_name, ", ", b.first_name, " ", b.middle_name) AS advisername,
        c.call_number,
        title,
        classification,
        date_published,
        grade,
        isBest,
        isBestPoster,
        a.student_number AS studnum,
        b.employee_number AS empnum,
        GROUP_CONCAT(DISTINCT " ", c.employee_number) AS coauthor_advisers,
        GROUP_CONCAT(DISTINCT " ", e.student_number) AS coauthor_students,
        GROUP_CONCAT(DISTINCT ' ', g.employee_number) AS panelmem,
        h.presentation_date AS presdate,
        h.presentation_place AS presplace
      FROM student a JOIN
        adviser b
      ON a.employee_number = b.employee_number JOIN
        paper d
      ON d.student_number = a.student_number LEFT JOIN
        co_authored_by_adviser c
      ON d.call_number = c.call_number LEFT JOIN
        co_authored_by_student e
      ON e.call_number = d.call_number JOIN
        paper_panel_adviser g
      ON d.call_number = g.call_number JOIN
        paper_panel h
      ON h.call_number = d.call_number
      GROUP BY
        d.call_number `;

    console.log(req.params);

    if (req.params.field !== "none" && req.params.input !== "none") {
      string_query += ` HAVING `;
      if (req.params.field === "call_number") {
        string_query += ` call_number LIKE '%${req.params.input}%' `;
      } else if (req.params.field === "employee_number") {
        string_query += ` empnum LIKE '%${req.params.input}%' `;
      } else if (req.params.field === "student_number") {
        string_query += ` studnum LIKE '%${req.params.input}%' `;
      } else if (req.params.field === "title") {
        string_query += ` title LIKE '%${req.params.input}%' `;
      } else if (req.params.field === 'studname') {
        string_query += ` studname LIKE '%${req.params.input}%' `;
      } else if (req.params.field === 'advisername') {
        string_query += ` advisername LIKE '%${req.params.input}%' `
      }

      if (req.params.isSP === '1') {
        string_query += ` AND classification='SP' `;
      } else if (req.params.isThesis === '1') {
        string_query != ` AND classification='Thesis' `;
      }

      if(req.params.isBest === '1') {
        string_query += ' AND isBest=1 ';
      }

      if(req.params.isBestPoster === '1') {
        string_query += ' AND isBestPoster=1 ';
      }

      if (req.params.panel !== 'none') {
        string_query += ' AND (' + req.params.panel.split(',').map(p => ` panelmem LIKE '%${p}%' `).join(' OR ') + ') ';
      }

      if (req.params.students !== 'none') {
        string_query += ' AND (' + req.params.students.split(',').map(student => ` coauthor_students LIKE '%${student}%'`).join(' OR ') + ') ';
      }

      if (req.params.advisers !== 'none') {
        string_query += ' AND (' + req.params.advisers.split(',').map(adviser => ` coauthor_advisers LIKE '%${adviser}%'`).join(' OR ') + ') ';
      }

    } else if (req.params.isSP !== '0'|| req.params.isThesis !== '0'){
      if (req.params.isSP === '1') {
        string_query += ` HAVING classification='SP'`;
      } else if (req.params.isThesis === '1') {
        string_query += ` HAVING classification='Thesis'`;
      }

      if(req.params.isBest === '1') {
        string_query += ' AND isBest=1 ';
      }

      if(req.params.isBestPoster === '1') {
        string_query += ' AND isBestPoster=1 ';
      }

      if (req.params.panel !== 'none') {
        string_query += ' AND (' + req.params.panel.split(',').map(p => ` panelmem LIKE '%${p}%' `).join(' OR ') + ') ';
      }

      if (req.params.students !== 'none') {
        string_query += ' AND (' + req.params.students.split(',').map(student => ` coauthor_students LIKE '%${student}%'`).join(' OR ') + ') ';
      }

      if (req.params.advisers !== 'none') {
        string_query += ' AND (' + req.params.advisers.split(',').map(adviser => ` coauthor_advisers LIKE '%${adviser}%'`).join(' OR ') + ') ';
      }
    } else if (req.params.isBest !== '0' || req.params.isBestPoster !== '0') {
      if (req.params.isBest === '1' && req.params.isBestPoster === '1') {
        string_query += ` HAVING isBest=1 AND isBestPoster=1 `;
      } else if (req.params.isBest === '1' && req.params.isBestPoster === '0') {
        string_query += ` HAVING isBest=1 `;
      } else if (req.params.isBest === '0' && req.params.isBestPoster === '1') {
        string_query += ` HAVING isBestPoster=1 `
      }

      if (req.params.panel !== 'none') {
        string_query += ' AND (' + req.params.panel.split(',').map(p => ` panelmem LIKE '%${p}%' `).join(' OR ') + ') ';
      }

      if (req.params.students !== 'none') {
        string_query += ' AND (' + req.params.students.split(',').map(student => ` coauthor_students LIKE '%${student}%'`).join(' OR ') + ') ';
      }

      if (req.params.advisers !== 'none') {
        string_query += ' AND (' + req.params.advisers.split(',').map(adviser => ` coauthor_advisers LIKE '%${adviser}%'`).join(' OR ') + ') ';
      }
    } else if (req.params.panel !== 'none') {
      if (req.params.panel !== 'none') {
        string_query += ' HAVING (' + req.params.panel.split(',').map(p => ` panelmem LIKE '%${p}%' `).join(' OR ') + ') ';
      }

      if (req.params.students !== 'none') {
        string_query += ' AND (' + req.params.students.split(',').map(student => ` coauthor_students LIKE '%${student}%'`).join(' OR ') + ') ';
      }

      if (req.params.advisers !== 'none') {
        string_query += ' AND (' + req.params.advisers.split(',').map(adviser => ` coauthor_advisers LIKE '%${adviser}%'`).join(' OR ') + ') ';
      }
    } else if (req.params.students !== 'none') {
      if (req.params.students !== 'none') {
        string_query += ' HAVING (' + req.params.students.split(',').map(student => ` coauthor_students LIKE '%${student}%'`).join(' OR ') + ') ';
      }

      if (req.params.advisers !== 'none') {
        string_query += ' AND (' + req.params.advisers.split(',').map(adviser => ` coauthor_advisers LIKE '%${adviser}%'`).join(' OR ') + ') ';
      }
    } else if (req.params.advisers !== 'none') {
        string_query += ' HAVING (' + req.params.advisers.split(',').map(adviser => ` coauthor_advisers LIKE '%${adviser}%'`).join(' OR ') + ') ';
    }

    if (req.params.sortOption !== "none") {
      string_query += ` ORDER BY ${req.params.sortOption} `
      if (req.params.sortBy !== "none") string_query += req.params.sortBy;
    }

    console.log(string_query);

    database.query(string_query, (response, result) => {
      res.json(result);
    });
  });

  router.post('/deletePaper/:id', (req, res) =>{
    let callnum = req.params.id;
    let string_query = `
      DELETE FROM
        paper_panel
      WHERE
        call_number='${callnum}';

      DELETE FROM
        paper_panel_adviser
      WHERE call_number='${callnum}';

      DELETE FROM
        paper
      WHERE call_number ='${callnum}'
      `;
    database.query(string_query, (error, result) => {
      if (error) res.json({'status': false});
      else res.json({'status': true});
    });
  });

  return router;
}
