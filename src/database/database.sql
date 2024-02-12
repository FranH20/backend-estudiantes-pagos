CREATE DATABASE db_estudiantes;

CREATE TABLE grado (
    nid_grado SERIAL PRIMARY KEY,
    desc_grado VARCHAR(30),
    nivel VARCHAR(30),
    orden INT UNIQUE
);

CREATE TABLE persona (
    nid_persona SERIAL PRIMARY KEY,
    nom_persona VARCHAR(50),
    ape_pate_pers VARCHAR(50),
    ape_mate_pers VARCHAR(50),
    fecha_naci DATE,
    foto_ruta VARCHAR(255),
    nid_grado INT,
    CONSTRAINT fk_grado
        FOREIGN KEY(nid_grado)
            REFERENCES grado(nid_grado)
);

CREATE TABLE cronograma (
    id_cronograma SERIAL PRIMARY KEY,
    year INT
);

CREATE TABLE detalle_cronograma (
    id_detalle_cronograma SERIAL PRIMARY KEY,
    desc_pension VARCHAR(50),
    monto NUMERIC,
    fecha_venci DATE,
    id_cronograma INT,
    id_grado INT,
    CONSTRAINT fk_cronograma
        FOREIGN KEY(id_cronograma)
            REFERENCES cronograma(id_cronograma),
    CONSTRAINT fk_grado
        FOREIGN KEY(id_grado)
            REFERENCES grado(nid_grado)
);

CREATE TABLE movimiento (
    id_movimiento SERIAL PRIMARY KEY,
    tipo_movimiento VARCHAR(20),
    monto NUMERIC,
    estado VARCHAR(20),
    fecha_pago TIMESTAMP,
    id_persona INT,
    id_detalle_cronograma INT,
    CONSTRAINT fk_persona
        FOREIGN KEY(id_persona)
            REFERENCES persona(nid_persona) ON DELETE CASCADE,
    CONSTRAINT fk_detalle_cronograma
        FOREIGN KEY(id_detalle_cronograma)
            REFERENCES detalle_cronograma(id_detalle_cronograma)
);


INSERT INTO grado(desc_grado, nivel, orden) VALUES ('2 años', 'INI', 1);
INSERT INTO grado(desc_grado, nivel, orden) VALUES ('3 años', 'INI', 2);
INSERT INTO grado(desc_grado, nivel, orden) VALUES ('4 años', 'INI', 3);
INSERT INTO grado(desc_grado, nivel, orden) VALUES ('5 años', 'INI', 4);
INSERT INTO grado(desc_grado, nivel, orden) VALUES ('Primero', 'PRI', 5);
INSERT INTO grado(desc_grado, nivel, orden) VALUES ('Segundo', 'PRI', 6);
INSERT INTO grado(desc_grado, nivel, orden) VALUES ('Tercero', 'PRI', 7);
INSERT INTO grado(desc_grado, nivel, orden) VALUES ('Cuarto', 'PRI', 8);
INSERT INTO grado(desc_grado, nivel, orden) VALUES ('Quinto', 'PRI', 9);
INSERT INTO grado(desc_grado, nivel, orden) VALUES ('Sexto', 'PRI', 10);
INSERT INTO grado(desc_grado, nivel, orden) VALUES ('Primero', 'SEC', 11);
INSERT INTO grado(desc_grado, nivel, orden) VALUES ('Segundo', 'SEC', 12);
INSERT INTO grado(desc_grado, nivel, orden) VALUES ('Tercero', 'SEC', 13);
INSERT INTO grado(desc_grado, nivel, orden) VALUES ('Cuarto', 'SEC', 14);
INSERT INTO grado(desc_grado, nivel, orden) VALUES ('Quinto', 'SEC', 15);

INSERT INTO cronograma(year) VALUES (2020);
INSERT INTO cronograma(year) VALUES (2021);
INSERT INTO cronograma(year) VALUES (2022);
INSERT INTO cronograma(year) VALUES (2023);
INSERT INTO cronograma(year) VALUES (2024);

INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('matricula', 350.0, '28-02-2024', 5, 1);
INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('marzo', 350.0, '28-03-2024', 5, 1);
INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('abril', 350.0, '28-04-2024', 5, 1);
INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('mayo', 350.0, '28-05-2024', 5, 1);
INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('junio', 350.0, '28-06-2024', 5, 1);
INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('julio', 350.0, '28-07-2024', 5, 1);
INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('agosto', 350.0, '28-08-2024', 5, 1);
INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('septiembre', 350.0, '28-09-2024', 5, 1);
INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('octubre', 350.0, '28-10-2024', 5, 1);
INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('noviembre', 350.0, '28-11-2024', 5, 1);
INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('diciembre', 350.0, '28-12-2024', 5, 1);

INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('matricula', 450.0, '28-02-2024', 5, 5);
INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('marzo', 450.0, '28-03-2024', 5, 5);
INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('abril', 450.0, '28-04-2024', 5, 5);
INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('mayo', 450.0, '28-05-2024', 5, 5);
INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('junio', 450.0, '28-06-2024', 5, 5);
INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('julio', 450.0, '28-07-2024', 5, 5);
INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('agosto', 450.0, '28-08-2024', 5, 5);
INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('septiembre', 450.0, '28-09-2024', 5, 5);
INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('octubre', 450.0, '28-10-2024', 5, 5);
INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('noviembre', 450.0, '28-11-2024', 5, 5);
INSERT INTO detalle_cronograma(desc_pension, monto, fecha_venci, id_cronograma, id_grado) VALUES ('diciembre', 450.0, '28-12-2024', 5, 5);

CREATE OR REPLACE PROCEDURE creando_persona_con_movimientos(
	nombre character varying(50), 
	apellidoPaterno character varying(50),
	apellidoMaterno character varying(50),
	fechaDeNacimiento date,
	ruta character varying(50),
	idGrado int)
language plpgsql
as $$
declare
	detalleCronograma RECORD;
	idPersona persona.nid_persona%TYPE;
begin
	INSERT INTO persona(nom_persona, ape_pate_pers, ape_mate_pers, fecha_naci, nid_grado, foto_ruta) 
	VALUES (nombre, apellidoPaterno, apellidoMaterno, fechaDeNacimiento, idGrado, ruta) RETURNING nid_persona INTO idPersona;
	for detalleCronograma in (SELECT id_detalle_cronograma FROM detalle_cronograma WHERE id_grado = idGrado ) loop
		INSERT INTO movimiento(tipo_movimiento, estado, monto, id_persona, id_detalle_cronograma) 
				VALUES ('INGRESO','POR PAGAR', 0, idPersona, detalleCronograma.id_detalle_cronograma);
	end loop;
end; $$;