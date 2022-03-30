const Mongoose = require("mongoose");

const LibrarianSchema = Mongoose.Schema(
  {
    librarian_id: {
      type: String,
      unique: true,
      required: true,
    },
    librarian_email: {
      type: String,
      trim: true,
      lowercase: true,
    },
    librarian_name: {
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

module.exports = Mongoose.model("Librarian", LibrarianSchema);
