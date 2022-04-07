import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_git/widget/navigation_drawer_widget.dart';

class NewRepository extends StatefulWidget {
  const NewRepository({Key? key}) : super(key: key);

  @override
  State<NewRepository> createState() => InitState();
}

class InitState extends State<NewRepository> {
  var userName, userImage;

  TextEditingController user = TextEditingController();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    getUserName().then((user_name) {
      setState(() {
        user = user_name;
      });
    });

    getUserImage().then((user_image) {
      setState(() {
        userImage = user_image;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(
          'New Repository',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'Nisebuschgardens',
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF41A58D),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: const Text(
                    'Create a new repository',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 10, top: 2),
                  child: const Text(
                    'A repository contains all project files, including the revision history. Already have a project repository elsewhere?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 18,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 20, top: 25),
                  child: const Text(
                    'Owner',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 18,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(left: 20, right: 20, top: 0),
              //   padding: const EdgeInsets.only(left: 20, right: 20),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(50),
              //     color: Colors.grey[200],
              //     boxShadow: const [
              //       BoxShadow(
              //           offset: Offset(0, 10),
              //           blurRadius: 50,
              //           color: Color(0xffEEEEEE))
              //     ],
              //   ),
              //   alignment: Alignment.centerLeft,
              //   child: const TextField(
              //     cursorColor: Color(0xFF41A58D),
              //     decoration: InputDecoration(
              //         icon: Icon(
              //           Icons.person,
              //           color: Color(0xFF276955),
              //         ),
              //         // hintText: "Enter your email",
              //         hintText: "Enter your password",
              //         enabledBorder: InputBorder.none,
              //         focusedBorder: InputBorder.none),
              //     // onChanged: (value) {
              //     //   userName = value;
              //     // },
              //   ),
              // ),
              // Container(
              //   margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              //   padding: const EdgeInsets.only(left: 20, right: 20),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(50),
              //     color: Colors.grey[200],
              //     boxShadow: const [
              //       BoxShadow(
              //           offset: Offset(0, 10),
              //           blurRadius: 50,
              //           color: Color(0xffEEEEEE))
              //     ],
              //   ),
              //   alignment: Alignment.centerLeft,
              //   child: TextField(
              //     obscureText: true,
              //     cursorColor: const Color(0xFF276955),
              //     decoration: const InputDecoration(
              //         icon: Icon(
              //           Icons.vpn_key,
              //           color: Color(0xFF276955),
              //         ),
              //         hintText: "Enter your password",
              //         enabledBorder: InputBorder.none,
              //         focusedBorder: InputBorder.none),
              //     onChanged: (value) {
              //       userName = value;
              //     },
              //   ),
              // ),
              // Container(
              //   margin: const EdgeInsets.only(top: 20, right: 20),
              //   alignment: Alignment.centerRight,
              //   child: GestureDetector(
              //     child: const Text("Forget Passwoed?"),
              //     onTap: () => {},
              //   ),
              // ),

              GestureDetector(
                // onTap: () => {loginUser(userEmail, userPass)},
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
                      // onTap: () => {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const RegisterScreen(),
                      //     ),
                      //   ),
                      // },
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
      ),
    );
  }
}

getUserName() async {
  final prefs = await SharedPreferences.getInstance();
  final String? name = prefs.getString('user_name');

  var userName = name;

  return userName;
}

getUserEmail() async {
  final prefs = await SharedPreferences.getInstance();
  final String? email = prefs.getString('user_email');

  var userEmail = email;

  return userEmail;
}

getUserImage() async {
  final prefs = await SharedPreferences.getInstance();
  final String? image = prefs.getString('user_image');

  String userImage = image.toString();

  return userImage;
}
