# Backend estudiantes pagos

## Instalacion


Primero se tiene que crear un archivo .env en el root del proyecto y agregar los valores del archivo .env.example .

`PORT`
`USER_POSTGRESQL`
`PASSWORD_POSTGRESQL`

Luego para crear la base de datos usar el archivo database.sql que se encuentra dentro de la carpeta database `daatabase.sql`.

Tambien se agrego un backup en caso de importarlo que se encuentra dentro de la carpeta database `BACKUP.sql`.

Luego para correr el proyecto usar el siguiente comando
```bash
npm run dev
```

## Otros

- Dentro de la carpeta database se encuentra dentro de database / querys los querys que se usaron para las consultas.

- Se creo un procedure para crear estudiantes `creando_persona_con_movimientos`.


## License

[MIT](https://choosealicense.com/licenses/mit/)