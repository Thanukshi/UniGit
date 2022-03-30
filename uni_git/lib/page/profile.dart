import 'package:flutter/material.dart';
import 'package:uni_git/page/Other/app_bar.dart';
// import 'package:uni_git/page/Other/profile_page.dart';
// import 'package:uni_git/widget/navigation_drawer_widget.dart';

// class ProfilePage extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         drawer: NavigationDrawerWidget(),
//         appBar: AppBar(
//           title: Text('Profile'),
//           centerTitle: true,
//           backgroundColor: Colors.blue,
//         ),
//       );
// }

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [],
      ),
    );
  }
}
