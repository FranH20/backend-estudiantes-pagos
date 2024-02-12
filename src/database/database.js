import pg from "pg";
import 'dotenv/config'

const config = {
  host: "localhost",
  database: "db_estudiantes",
  user: process.env.USER_POSTGRESQL,
  password: process.env.PASSWORD_POSTGRESQL,
  port: "5432",
};

const pool = new pg.Pool(config);

export default pool;
