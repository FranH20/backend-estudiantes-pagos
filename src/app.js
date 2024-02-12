import express from "express";
import cors from "cors";
import morgan from "morgan";

const app = express();

import personaRoute from "./routes/persona.route.js";
import gradoRoute from "./routes/grado.route.js";
import movimientoRoute from "./routes/movimiento.route.js";

// Middlewares
app.use(express.static("public"));
app.use(cors());
app.use(morgan("dev"));
app.use(express.json({ limit: "50mb" }));

// Routes
app.use("/personas", personaRoute);
app.use("/grados", gradoRoute);
app.use("/movimientos", movimientoRoute);
export default app;
