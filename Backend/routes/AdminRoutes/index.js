const routes = require("express").Router();

const AdminRoutes = require("../../controller/Admin/librarian.controller");
const utils = require("../../lib/utils");

routes.post("/add_librarian", AdminRoutes.addLibrarian);

// routes.post("/login", UserRoutes.loginUser);

// routes.get("/getAllUser", UserRoutes.getAllUsers);

// routes.get("/getUser/:id", UserRoutes.getUserDetailsByID);

// routes.get("/getUser", utils.authMiddleware, UserRoutes.getUserDetails);

module.exports = routes;