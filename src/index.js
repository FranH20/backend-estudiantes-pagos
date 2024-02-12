import app from "./app.js";
import 'dotenv/config'

const PUERTO = process.env.PORT;

function main() {
  try {
    app.listen(PUERTO);
    console.log("Servidor escuchando en el puerto", PUERTO);
  } catch (error) {
    console.log("No es posible conectarse  a la base de datos : ", error);
  }
}

main();
