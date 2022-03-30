const routes = require("express").Router();

const UserRoutes = require("./UserRoutes");
const LibrarianRoutes = require("./AdminRoutes");

routes.use("/user", UserRoutes);
routes.use("/librarian", LibrarianRoutes);
//routes.use("/loan", LoanRoutes);

module.exports = routes;