import multer from "multer";
import path from "path";

const storage = multer.diskStorage({
  destination: "./public/files/avatars",
  filename: (req, file, cb) => {
    console.log("Ingresando a multer")
    const uniqueSuffix =
      Date.now() + "-" + Math.round(Math.random() * (100 - 1) + 1);
    const ext = path.extname(file.originalname);
    cb(null, file.fieldname + "-" + uniqueSuffix + ext);
  },
});

export default multer({ storage: storage });
