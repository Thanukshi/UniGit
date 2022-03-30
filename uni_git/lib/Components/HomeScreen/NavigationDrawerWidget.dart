import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  static final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) => Drawer(
        child: Container(
          padding: padding,
          decoration: const BoxDecoration(
            color: Color(0xFF41A58D),
            gradient: LinearGradient(
              colors: [Color(0xFF41A58D), Color(0xFF276955)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  buildMenuItem(
                    context,
                    text: "New",
                    icon: Icons.new_label,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                    context,
                    text: "Repositories",
                    icon: Icons.list,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                    context,
                    text: "Favourities",
                    icon: Icons.favorite,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                    context,
                    text: "Followers",
                    icon: Icons.follow_the_signs,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                    context,
                    text: "Profile",
                    icon: Icons.person,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(height: 24),
                  Divider(color: Colors.white),
                  const SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                    context,
                    text: "Settings",
                    icon: Icons.settings,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                    context,
                    text: "Pluggins",
                    icon: Icons.account_tree,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                    context,
                    text: "Notifications",
                    icon: Icons.notifications,
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  buildMenuItem(BuildContext context,
      {required String text, required IconData icon}) {
    final color = Colors.white;
    return Material(
      color: Colors.transparent,
      child: ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(
          text,
          style: TextStyle(color: color, fontSize: 18),
        ),
        onTap: () {},
      ),
    );
  }
}
