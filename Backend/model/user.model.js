const Mongoose = require("mongoose");

const UserSchema = Mongoose.Schema(
  {
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
    user_image: {
      type: String,
      trim: true,
      default:
        "https://images.unsplash.com/photo-1610271340738-726e199f0258?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=3&w=256&h=256&q=80",
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
