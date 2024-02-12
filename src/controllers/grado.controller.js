import pool from "../database/database.js";
import { queryObtenerGrados } from "../database/querys/gradoQuery.js";

export const obtenerGrados = async (req, res) => {
  try {
    const query = queryObtenerGrados();
    const databaseResponse = await pool.query(query);
    return res.status(200).json(databaseResponse.rows);
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
};
