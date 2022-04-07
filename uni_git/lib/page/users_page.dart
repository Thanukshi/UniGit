import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_git/Components/Common/common.dart';
import 'package:uni_git/Constatnt/constants.dart';
import 'package:uni_git/widget/navigation_drawer_widget.dart';
import 'package:http/http.dart' as http;

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List users = [];
  bool isLoading = false;
  var ID;

  @override
  void initState() {
    super.initState();
    fetchUser();
    getUserId().then((id) {
      setState(() {
        ID = id;
      });
    });
  }

  getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final String? id = prefs.getString('id');

    // ignore: non_constant_identifier_names
    var ID = id;
    print(ID);

    return ID;
  }

  fetchUser() async {
    setState(() {
      isLoading = true;
    });

    var url = Uri.parse(CommonService.URL + "/user/other_users/$ID");
    // var url = Uri.parse("https://randomuser.me/api/?results=50");
    var response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['UserDetails'];

      setState(() {
        users = items;
        isLoading = false;
      });
    } else {
      users = [];
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(
          'Users',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'Nisebuschgardens',
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF41A58D),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    // ignore: prefer_is_empty
    if (users.contains(null) || users.length < 0 || isLoading) {
      return const Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(primary),
      ));
    }
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return getCard(users[index]);
        });
  }

//   Widget getCard() {
//     return Card(
//       child: ListTile(
//         title: Row(
//           children: <Widget>[
//             Container(
//               width: 60,
//               height: 60,
//               decoration: const BoxDecoration(
//                   color: Colors.blueGrey,
//                   borderRadius: BorderRadius.circular(60 / 2),
//                   image: DecorationImage(
//                       fit: BoxFit.cover, image: NetworkImage(profileUrl))),
//             ),
//             const SizedBox(width: 30),
//             Container(
//               child: const Text(
//                 "HI",
//                 textAlign: TextAlign.left,
//               ),
//             ),
//             const SizedBox(width: 160),
//             Container(
//               width: 20,
//               height: 20,
//               child: const Icon(
//                 Icons.cancel_sharp,
//                 color: Color(0xFF276955),
//               ),
//             ),
//             const SizedBox(width: 10),
//             Container(
//               width: 20,
//               height: 20,
//               child: const Icon(
//                 Icons.add_circle_outlined,
//                 color: Color(0xFF276955),
//               ),
//             ),
//             const SizedBox(width: 10),
//             Container(
//               width: 20,
//               height: 20,
//               child: const Icon(
//                 Icons.cancel_sharp,
//                 color: Colors.redAccent,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

  Widget getCard(item) {
    var fullName = item['user_name'];
    var email = item['user_email'];
    var profileUrl = item['user_image'];
    return Card(
        elevation: 1.5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            onTap: () {},
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.all(2.0),
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(60 / 2),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(profileUrl))),
                ),
                const SizedBox(width: 30),
                Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.all(2.0),
                  child: Text(fullName,
                      style: const TextStyle(fontSize: 17),
                      textAlign: TextAlign.left),
                ),
                const SizedBox(width: 30),
                Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(2.0),
                  child: const Icon(
                    Icons.add_circle_outlined,
                    color: Color(0xFF276955),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.all(2.0),
                  padding: const EdgeInsets.all(3.0),
                  child: const Icon(
                    Icons.cancel_sharp,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
