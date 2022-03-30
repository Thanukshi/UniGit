const routes = require("express").Router();

const UserRoutes = require("./UserRoutes");

routes.use("/user", UserRoutes);
//routes.use("/loan", LoanRoutes);

module.exports = routes;