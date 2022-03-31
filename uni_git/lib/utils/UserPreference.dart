// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_git/model/user.dart';

class UserPrefernces {
  Future<void> getAllDetails() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString(this.userName, userName);
    // prefs.setString(this.userEmail, userEmail);
    // prefs.setString(this.userImage, userImage);

    final prefs = await SharedPreferences.getInstance();
    final String? userName = prefs.getString('user_name');
    final String? userEmail = prefs.getString('user_email');
    final String? userImage = prefs.getString('user_image');
  }

  static const myUser = User(
    imagePath: "userName",
    userName: 'Sarah Abs',
    userEmail: 'sarah.abs@gmail.com',
    isDarkMode: false,
  );
}
