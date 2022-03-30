const User = require("../model/user.model");

const utils = require("../lib/utils");

exports.registerUser = async function (req, res, next) {
  const { user_email, user_name, user_password, user_cPassword } = req.body;

  try {
    if (!user_email) {
      return res.status(200).json({
        code: 204,
        status: "No Content",
        Success: false,
        message: "Please enter a your email.",
      });
    } else if (!user_name) {
      return res.status(200).json({
        code: 204,
        status: "No Content",
        Success: false,
        message: "Please enter a your user name.",
      });
    } else if (!user_password) {
      return res.status(200).json({
        code: 204,
        status: "No Content",
        Success: false,
        message: "Please enter a your password.",
      });
    } else if (!validateEmail(user_email)) {
      return res.status(200).json({
        code: 406,
        success: false,
        status: "Not Acceptable",
        message: "Email is invalid, Please enter a valid email",
      });
    } else if (!validatePassword(user_password)) {
      return res.status(200).json({
        code: 406,
        success: false,
        status: "Not Acceptable",
        message:
          "Password has 8 characters, It must have one uppercase letter, lowercase letter, number and special character.",
      });
    } else if (user_cPassword != user_password) {
      return res.status(200).json({
        code: 406,
        success: false,
        status: "Not Acceptable",
        message:
          "Confirm Password does not match with the password. Please check again.",
      });
    } else {
      const userEmail = await User.findOne({ user_email });

      const userName = await User.findOne({ user_name });

      if (userEmail) {
        return res.status(200).json({
          code: 208,
          success: false,
          status: "Email is Already Reported",
          message: "This email is already exists.",
        });
      } else if (userName) {
        return res.status(200).json({
          code: 208,
          success: false,
          status: "User Name is Already Reported",
          message: "This user name is already exists.",
        });
      } else if (userEmail && userName) {
        return res.status(200).json({
          code: 208,
          success: false,
          status: "Already Reported",
          message: "This user name is already exists with this email.",
        });
      } else {
        const saltHash = utils.genPassword(user_password);

        const salt = saltHash.salt;
        const hash = saltHash.hash;

        const newUser = new User({
          user_email,
          user_name,
          hash: hash,
          salt: salt,
          user_image:
            "https://www.vhv.rs/dpng/d/436-4363443_view-user-icon-png-font-awesome-user-circle.png",
        });

        const tokenObject = utils.issueJWT(newUser);
        await newUser.save();

        return res.status(200).json({
          code: 201,
          status: "Created",
          Success: true,
          token: tokenObject.token,
          expiresIn: tokenObject.expires,
          sub: tokenObject.sub,
          UserDetails: newUser,
        });
      }
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

exports.loginUser = async function (req, res, next) {
  const { user_email, user_password } = req.body;
  try {
    if (!user_email) {
      return res.status(200).json({
        code: 204,
        status: "No Content",
        Success: false,
        message: "Please enter a your email address.",
      });
    } else if (!user_password) {
      return res.status(200).json({
        code: 204,
        status: "No Content",
        Success: false,
        message: "Please enter a your password.",
      });
    } else {
      const userEmail = await User.findOne({ user_email });

      if (!userEmail) {
        return res.status(200).json({
          code: 203,
          success: false,
          status: "Non-Authoritative Information",
          message:
            "You are not a registerd user. Please register before login.",
        });
      } else {
        const isValid = utils.validPassword(
          user_password,
          userEmail.hash,
          userEmail.salt
        );

        if (isValid) {
          const tokenObject = utils.issueJWT(userEmail);

          res.status(200).json({
            code: 202,
            success: true,
            status: "Accepted",
            token: tokenObject.token,
            expiresIn: tokenObject.expires,
            sub: tokenObject.sub,
          });
        } else {
          res.status(200).json({
            code: 203,
            success: false,
            status: "Password - Non-Authoritative Information",
            msg: "You entered the wrong password. Please check again.",
          });
        }
      }
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

exports.uploadImage = async function (req, res, next) {
  try {
    const result = await cloudinary.uploader.upload(req.file.path, {
      folder: "EmployeeList",
    });
    if (req.params && req.params.id) {
      await Employee.findByIdAndUpdate(req.params.id, {
        employee_image: result.secure_url,
      });

      const uploadImage = await Employee.findById(req.params.id);

      return res.status(200).json({
        code: 200,
        success: true,
        status: "OK",
        UpdateEmployee: uploadImage,
        message: "Image upload successfully.",
      });
    }
  } catch (error) {
    return res.status(500).json({
      code: 500,
      success: false,
      status: "Internal Server Error",
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
