import { Router } from "express";
import { obtenerPagos } from "../controllers/movimiento.controller.js";

const router = Router();

router.get("/pagos", obtenerPagos);

export default router;
