const routes = require("express").Router();

const UserRoutes = require("../../controller/user.controller");
const utils = require("../../lib/utils");

const upload = require("../../utils/multer");

routes.post("/register", UserRoutes.registerUser);

routes.post("/login", UserRoutes.loginUser);

routes.put("/image/:id", upload.single("image"), UserRoutes.uploadImage);

routes.get("/all_users", UserRoutes.getAllUser);

// routes.get("/getUser/:id", UserRoutes.getUserDetailsByID);

// routes.get("/getUser", utils.authMiddleware, UserRoutes.getUserDetails);

module.exports = routes;
