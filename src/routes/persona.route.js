import { Router } from "express";
import {
  borrarEstudiante,
  buscarEstudiante,
  crearEstudiante,
  obtenerPersonasEstudiantes,
  subirAvatarPersona,
} from "../controllers/persona.controller.js";
import UploadSingleFile from "../middlewares/fileUploadConfiguration.js";

const router = Router();

router.patch(
  "/:id/uploadAvatar",
  UploadSingleFile.single("file"),
  subirAvatarPersona
);
router.get("/estudiantes", obtenerPersonasEstudiantes);
router.get("/:name", buscarEstudiante);
router.post("/", crearEstudiante);
router.delete("/:id", borrarEstudiante);
export default router;
