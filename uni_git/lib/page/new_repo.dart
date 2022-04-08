import 'package:flutter/material.dart';
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
      drawer: const NavigationDrawerWidget(),
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
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 25),
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
                  margin: const EdgeInsets.only(left: 10, top: 15, right: 16),
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
                  margin: const EdgeInsets.only(left: 20, top: 30),
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
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Owner',
                    ),
                    readOnly: true,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Repository Name',
                      hintText: 'Enter Repository Name',
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description',
                      hintText: 'Enter a Description',
                    ),
                  ),
                ),
              ),
              GestureDetector(
                // onTap: () => {loginUser(userEmail, userPass)},
                //{loginUser(userEmail, userPass)},
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
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
                    "Create Repository",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
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
