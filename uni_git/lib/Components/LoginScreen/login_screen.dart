import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_git/Components/Common/common.dart';
import 'package:uni_git/Components/HomeScreen/home_screen.dart';
import 'package:uni_git/Components/RegisterScreen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<LoginScreen> {
  String? userValue;

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    final userTypes = [
      'Student',
      'Librarian',
    ];

    String userEmail = '';
    String userPass = '';
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: Color(0xFF41A58D),
                gradient: LinearGradient(
                  colors: [Color(0xFF41A58D), Color(0xFF276955)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 50,
                      ),
                      child: Image.asset("assets/images/logo1.png"),
                      height: 150,
                      width: 150,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20, top: 10),
                      alignment: Alignment.bottomRight,
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                width: 600,
                margin: const EdgeInsets.only(
                    top: 40, left: 20, bottom: 5, right: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: const Color(0xFF276955),
                    width: 4,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: const Text(
                      "Select User Type",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    value: userValue,
                    iconSize: 36,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xFF276955),
                    ),
                    items: userTypes.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(
                      () => userValue = value,
                    ),
                  ),
                )),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE))
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                cursorColor: const Color(0xFF41A58D),
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Color(0xFF276955),
                    ),
                    hintText: "Enter your email",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
                onChanged: (value) {
                  userEmail = value;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE))
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                obscureText: true,
                cursorColor: const Color(0xFF276955),
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.vpn_key,
                      color: Color(0xFF276955),
                    ),
                    hintText: "Enter your password",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
                onChanged: (value) {
                  userPass = value;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, right: 20),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: const Text("Forget Passwoed?"),
                onTap: () => {},
              ),
            ),
            GestureDetector(
              onTap: () => {loginUser(userValue!, userEmail, userPass)},
              //{loginUser(userEmail, userPass)},
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                padding: const EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF276955),
                        (Color(0xFF41A58D)),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      (BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE),
                      ))
                    ]),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an Account?  "),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      ),
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF276955),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      );

  void loginUser(String userType, String email, String password) async {
    print("user type" + userType);
    if (email == "" || email == Null) {
      showErrorToast(
          context, "Email Error", "Email can no be empty. Please Enter Email.");
    } else if (password == "" || password == Null) {
      showErrorToast(context, "Password Error",
          "Password can no be empty. Please Enter Password.");
    } else if (!isEmail(email)) {
      showErrorToast(context, "Email Error",
          "This email address is invalid. Please enter a valid email address.");
    } else {
      try {
        final prefs = await SharedPreferences.getInstance();
        final String? token = prefs.getString('token');

        if ("{$token}" == Null || "{$token}" == '{null}') {
          if (userType == "Student") {
            var response = await Dio().post(CommonService.URL + "/user/login",
                data: {
                  "user_type": userType,
                  "user_email": email,
                  "user_password": password
                });
            print("datasss" + response.data.toString());

            if (response.statusCode == 200) {
              if (response.data['code'] == 203 &&
                  response.data['status'] == "Non-Authoritative Information") {
                showErrorToast(context, "Email Error",
                    response.data["message"].toString());
              } else if (response.data['code'] == 203 &&
                  response.data['status'] ==
                      "Password - Non-Authoritative Information") {
                showErrorToast(
                    context, "Password Error", response.data["msg"].toString());
              } else if (response.data["code"] == 202) {
                await prefs.setString(
                    'token', response.data["token"].toString());

                print(response.data["token"]);
                print("token {$token}");

                // showSuccessToast(
                //     context, "Login", "You were logged successfully.");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              } else {
                showErrorToast(context, "Error", "1Something went wrong...");
              }
            }
          }
          if (userType == "Librarian") {
            var response = await Dio().post(CommonService.URL + "/user/login",
                data: {
                  "user_type": userType,
                  "librarian_email": email,
                  "libraian_password": password
                });
            print("datasss" + response.data.toString());

            if (response.statusCode == 200) {
              if (response.data['code'] == 203 &&
                  response.data['status'] == "Non-Authoritative Information") {
                showErrorToast(context, "Email Error",
                    response.data["message"].toString());
              } else if (response.data['code'] == 203 &&
                  response.data['status'] ==
                      "Password - Non-Authoritative Information") {
                showErrorToast(
                    context, "Password Error", response.data["msg"].toString());
              } else if (response.data["code"] == 202) {
                await prefs.setString(
                    'token', response.data["token"].toString());

                print(response.data["token"]);
                print("token {$token}");

                // showSuccessToast(
                //     context, "Login", "You were logged successfully.");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              } else {
                showErrorToast(context, "Error", "1Something went wrong...");
              }
            }
          }
        } else {
          showErrorToast(context, "Error", "2Something went wrong...");
        }
      } catch (e) {
        print(e);
      }
    }
  }

  bool isEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(email);
  }

  bool isPassword(String password) {
    String p = r'(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(password);
  }

  void showSuccessToast(context, toastTitle, toastDescription) {
    MotionToast.success(
      description: Text(
        "$toastDescription",
        style: const TextStyle(fontSize: 14),
      ),
      title: Text(
        "$toastTitle",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ).show(context);
  }

  void showErrorToast(context, toastTitle, toastDescription) {
    MotionToast.error(
      description: Text(
        "$toastDescription",
        style: const TextStyle(fontSize: 14),
      ),
      title: Text(
        "$toastTitle",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ).show(context);
  }
}
