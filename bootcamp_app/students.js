const cohortName = process.argv[2];
const limitBy = process.argv[3] || 5;

const values = [`%${cohortName}%`, limitBy];

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
SELECT students.id, students.name, cohort_id, cohorts.name as cohort_name
FROM students JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE $1
LIMIT $2;
`, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in ${user.cohort_name} cohort`)
  })
})
.catch(err => console.error('query error', err.stack));