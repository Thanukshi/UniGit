const Librarian = require("../../model/librarian.model");

const utils = require("../../lib/utils");
var LocalStorage = require("node-localstorage").LocalStorage,
  localStorage = new LocalStorage("./scratch");

exports.addLibrarian = async function (req, res, next) {
  var librarianID;
  const { librarian_email, librarian_name, libraian_password } = req.body;

  try {
    if (!librarian_email) {
      return res.status(200).json({
        code: 204,
        status: "No Content",
        Success: false,
        message: "Please enter a your id.",
      });
    } else if (!librarian_name) {
      return res.status(200).json({
        code: 204,
        status: "No Content",
        Success: false,
        message: "Please enter a your email.",
      });
    } else if (!validateEmail(librarian_email)) {
      return res.status(200).json({
        code: 406,
        success: false,
        status: "Not Acceptable",
        message: "Email is invalid, Please enter a valid email",
      });
    } else if (!validatePassword(libraian_password)) {
      return res.status(200).json({
        code: 406,
        success: false,
        status: "Not Acceptable",
        message:
          "Password has 8 characters, It must have one uppercase letter, lowercase letter, number and special character.",
      });
    } else {
      const LibrarianEmail = await Librarian.findOne({ librarian_email });
      if (LibrarianEmail) {
        return res.status(200).json({
          code: 208,
          success: false,
          status: "Already Reported",
          message: "This email is already exists.",
        });
      }

      const LibrarianName = await Librarian.findOne({ librarian_name });
      if (LibrarianName) {
        return res.status(200).json({
          code: 208,
          success: false,
          status: "Already Reported",
          message: "This name is already exists.",
        });
      }

      var str = localStorage.getItem("ID");
      console.log("str", str);
      var id = parseInt(str);

      if (str === "NaN" || str === "" || str === null) {
        id = 1;
      } else {
        id = id + 1;
      }

      function padLeadingZeros(num, size) {
        var s = num + "";
        while (s.length < size) s = "0" + s;
        return s;
      }

      librarianID = padLeadingZeros(id, 6);
      librarianID = "LB" + librarianID;

      console.log("first", librarianID);

      const saltHash = utils.genPassword(libraian_password);

      const salt = saltHash.salt;
      const hash = saltHash.hash;

      const newUser = new Librarian({
        librarian_id: librarianID,
        librarian_email,
        librarian_name,
        hash: hash,
        salt: salt,
        user_type: "librarian",
      });

      //const tokenObject = utils.issueJWT(newUser);
      await newUser.save();

      return res.status(200).json({
        code: 201,
        status: "Created",
        Success: true,
        LibrarianDetails: newUser,
      });
    }
  } catch (error) {
    return res.status(500).json({
      code: 500,
      status: "Internal Server Error",
      Success: false,
      message: error.message,
    });
  }
};

function validateEmail(email) {
  const re =
    /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(email);
}

function validatePassword(password) {
  var re = /^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
  return re.test(password);
}
