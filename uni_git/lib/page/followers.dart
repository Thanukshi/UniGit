import 'package:flutter/material.dart';
import 'package:uni_git/widget/navigation_drawer_widget.dart';

class FollowersPage extends StatefulWidget {
  const FollowersPage({Key? key}) : super(key: key);

  @override
  State<FollowersPage> createState() => _FollowersPageState();
}

class _FollowersPageState extends State<FollowersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(
          'Followers',
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
}

Widget getBody() {
  return ListView.builder(itemBuilder: (context, index) {
    index = index + 1;
    return Text("Index $index");
  });
}
