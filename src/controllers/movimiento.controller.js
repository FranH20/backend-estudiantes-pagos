import pool from "../database/database.js";
import { getQueryReporte } from "../database/querys/movimientoQuery.js";

export const obtenerPagos = async (req, res) => {
  try {
    const query = getQueryReporte();
    const response = await pool.query(query);
    return res.status(200).json(response.rows);
  } catch (error) {
    return res.status(500).json({
      message: error.message,
    });
  }
};
