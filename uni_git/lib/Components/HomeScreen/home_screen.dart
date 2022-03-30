import 'package:flutter/material.dart';
import 'package:uni_git/Components/HomeScreen/NavigationDrawerWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(
          "UNI GIT",
          style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF41A58D),
      ),
    );
  }
}
