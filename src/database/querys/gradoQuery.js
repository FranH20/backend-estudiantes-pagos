export const queryObtenerGrados = () =>
  "SELECT nid_grado,desc_grado, nivel, orden FROM grado ORDER BY orden ASC";
