

const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'vagrant'
});

pool.connect( () => {
  console.log('Connected to the database...')
} );


pool.query(`
  SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
  FROM cohorts JOIN students ON cohorts.id = cohort_id
               JOIN assistance_requests ON students.id = student_id
               JOIN teachers ON teachers.id = teacher_id
  WHERE cohorts.name = '${process.argv[2] || 'JUL02'}'
  ORDER BY teacher;
`)
.then(res => {
  res.rows.forEach(rows => {
    console.log(`${rows.cohort}: ${rows.teacher}`)
  })
})
.catch(err => console.error('query error', err.stack));