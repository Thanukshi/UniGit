import 'package:flutter/material.dart';
import 'package:uni_git/widget/navigation_drawer_widget.dart';

class PluginsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text(
            'Plugin',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'Nisebuschgardens',
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF41A58D),
        ),
      );
}
