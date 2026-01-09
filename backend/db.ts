import { Pool } from 'pg';

// We use 'db' as the host because that is the name of the service in docker-compose
const pool = new Pool({
  user: 'myuser',
  host: 'db', 
  database: 'baladi_db',
  password: 'mypassword',
  port: 5432,
});

export default pool;