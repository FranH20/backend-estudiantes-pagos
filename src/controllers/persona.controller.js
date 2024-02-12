import pool from "../database/database.js";
import {
  createProcedurePersonaMovimiento,
  obtenerEstudiantes,
  obtenerPorNombre,
  queryBorrarEstudiante,
} from "../database/querys/personaQuerys.js";

export const crearEstudiante = async (req, res) => {
  const {
    nombre,
    apellidoPaterno,
    apellidoMaterno,
    fechaDeNacimiento,
    idGrado,
  } = req.body;
  try {
    const query = createProcedurePersonaMovimiento();
    const values = [
      nombre,
      apellidoPaterno,
      apellidoMaterno,
      fechaDeNacimiento,
      "files/avatars/default.jpg",
      idGrado,
    ];
    await pool.query(query, values);
    return res.status(200).end();
  } catch (error) {
    return res.status(500).json({
      message: error.message,
    });
  }
};

export const subirAvatarPersona = async (req, res) => {
  const { id } = req.params;
  try {
    let query = `SELECT nid_persona, nom_persona FROM persona WHERE nid_persona = ${id}`;
    const persona = await pool.query(query);
    if (persona.rowCount <= 0) {
      return res.status(404).json({
        messsage: "No se encontro el usuario",
      });
    }
    await pool.query(
      "UPDATE persona SET foto_ruta = $1 WHERE nid_persona = $2",
      [req.file.path, id]
    );
    return res.status(204).end();
  } catch (error) {
    return res.status(500).json({
      message: error.message,
    });
  }
};

export const buscarEstudiante = async (req, res) => {
  const { name } = req.params;
  try {
    const query = obtenerPorNombre(name);
    const response = await pool.query(query);
    return res.status(200).json(response.rows);
  } catch (error) {
    return res.status(500).json({
      message: error.message,
    });
  }
};

export const obtenerPersonasEstudiantes = async (req, res) => {
  try {
    const query = obtenerEstudiantes();
    const response = await pool.query(query);
    return res.status(200).json(response.rows);
  } catch (error) {
    return res.status(500).json({
      message: error.message,
    });
  }
};

export const borrarEstudiante = async (req, res) => {
  const { id } = req.params;
  try {
    const query = queryBorrarEstudiante(id);
    await pool.query(query);
    return res.status(200).end();
  } catch (error) {
    return res.status(500).json({
      message: error.message,
    });
  }
};
