export const getQueryReporte = () => `SELECT 
CONCAT(p1.nom_persona, ' ', p1.ape_pate_pers, ' ' , p1.ape_mate_pers) AS estudiante,
CONCAT(g2.desc_grado, ' - ', g2.nivel) AS grado,
dc1.desc_pension,
dc1.monto,
TO_CHAR(dc1.fecha_venci, 'dd/mm/yyyy') AS fecha_venci,
TO_CHAR(m1.fecha_pago, 'dd/mm/yyyy') AS fecha_pago, 
c1.year
FROM persona p1
INNER JOIN grado g2 ON p1.nid_grado = g2.nid_grado
INNER JOIN movimiento m1 ON p1.nid_persona = m1.id_persona
INNER JOIN detalle_cronograma dc1 ON m1.id_detalle_cronograma = dc1.id_detalle_cronograma
INNER JOIN cronograma c1 ON dc1.id_cronograma = c1.id_cronograma
ORDER BY p1.nid_persona, dc1.fecha_venci ASC`;
