const routes = require("express").Router();

const UserRoutes = require("../../controller/user.controller");
const utils = require("../../lib/utils");

routes.post("/register", UserRoutes.registerUser);

routes.post("/login", UserRoutes.loginUser);

// routes.get("/getAllUser", UserRoutes.getAllUsers);

// routes.get("/getUser/:id", UserRoutes.getUserDetailsByID);

// routes.get("/getUser", utils.authMiddleware, UserRoutes.getUserDetails);

module.exports = routes;
