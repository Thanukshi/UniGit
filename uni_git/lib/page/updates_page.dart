import 'package:flutter/material.dart';
import 'package:uni_git/widget/navigation_drawer_widget.dart';

class UpdatesPage extends StatelessWidget {
  const UpdatesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Updates'),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ),
      );
}
