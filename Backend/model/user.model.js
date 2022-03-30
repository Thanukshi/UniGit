const Mongoose = require("mongoose");

const UserSchema = Mongoose.Schema(
  {
    user_id: {
      type: String,
      unique: true,
      required: true,
    },
    user_email: {
      type: String,
      trim: true,
      lowercase: true,
    },
    user_name: {
      type: String,
      unique: true,
      required: true,
    },
    hash: {
      type: String,
    },
    salt: {
      type: String,
    },
    user_type: {
      type: String,
    },
  },
  {
    timestamps: {
      type: Date,
      default: Date.now,
    },
  }
);

module.exports = Mongoose.model("User", UserSchema);
