export const createProcedurePersonaMovimiento = () =>
  `CALL creando_persona_con_movimientos($1, $2, $3, $4, $5)`;

export const obtenerPersona = (id) =>
  `SELECT nid_persona, nom_persona FROM persona WHERE nid_persona = ${id}`;

export const obtenerEstudiantes = () => `SELECT 
p1.nid_persona, 
CONCAT_WS(' ', p1.nom_persona, p1.ape_pate_pers, p1.ape_mate_pers) full_name, 
AGE(CURRENT_DATE, p1.fecha_naci) age,
CONCAT_WS(' ', desc_grado, nivel) grado,
p1.foto_ruta
FROM persona p1
INNER JOIN grado g1 ON g1.nid_grado = p1.nid_grado
ORDER BY p1.nid_persona DESC`;

export const obtenerPorNombre = (nombre) => `
SELECT 
p1.nid_persona, 
CONCAT_WS(' ', p1.nom_persona, p1.ape_pate_pers, p1.ape_mate_pers) full_name, 
AGE(CURRENT_DATE, p1.fecha_naci) age,
CONCAT_WS(' ', desc_grado, nivel) grado,
p1.foto_ruta
FROM persona p1
INNER JOIN grado g1 ON g1.nid_grado = p1.nid_grado
WHERE LOWER(CONCAT_WS(' ', p1.nom_persona,p1.ape_pate_pers, p1.ape_mate_pers)) LIKE LOWER('%${nombre}%') 
ORDER BY p1.nid_persona DESC LIMIT 5
`;

export const queryBorrarEstudiante = (id) => `DELETE FROM persona WHERE nid_persona = ${id}`