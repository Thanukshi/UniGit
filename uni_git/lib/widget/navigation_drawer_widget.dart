import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_git/data/user.dart';
import 'package:uni_git/model/navigation_item.dart';
import 'package:uni_git/provider/navigation_provider.dart';

class NavigationDrawerWidget extends StatelessWidget {
  static const padding = EdgeInsets.symmetric(horizontal: 15);

  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: Container(
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
              buildHeader(
                context,
                urlImage: urlImage,
                name: name,
                email: email,
              ),
              Container(
                padding: padding,
                child: Column(
                  children: [
                    buildMenuItem(
                      context,
                      item: NavigationItem.home,
                      text: 'Home',
                      icon: Icons.home,
                    ),
                    const SizedBox(height: 10),
                    buildMenuItem(
                      context,
                      item: NavigationItem.newRepo,
                      text: 'New',
                      icon: Icons.new_label,
                    ),
                    const SizedBox(height: 10),
                    buildMenuItem(
                      context,
                      item: NavigationItem.repositories,
                      text: 'Repositories',
                      icon: Icons.list,
                    ),
                    const SizedBox(height: 10),
                    buildMenuItem(
                      context,
                      item: NavigationItem.users,
                      text: 'Users',
                      icon: Icons.people,
                    ),
                    const SizedBox(height: 10),
                    buildMenuItem(
                      context,
                      item: NavigationItem.followers,
                      text: 'Followers',
                      icon: Icons.follow_the_signs,
                    ),
                    const SizedBox(height: 10),
                    buildMenuItem(
                      context,
                      item: NavigationItem.favourites,
                      text: 'Favourites',
                      icon: Icons.favorite,
                    ),
                    const SizedBox(height: 10),
                    buildMenuItem(
                      context,
                      item: NavigationItem.profile,
                      text: 'Profile',
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 16),
                    Divider(color: Colors.white70),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      context,
                      item: NavigationItem.settings,
                      text: 'Setttings',
                      icon: Icons.settings,
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      context,
                      item: NavigationItem.plugins,
                      text: 'Plugins',
                      icon: Icons.account_tree_outlined,
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      context,
                      item: NavigationItem.notifications,
                      text: 'Notifications',
                      icon: Icons.notifications_outlined,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem(
    BuildContext context, {
    required NavigationItem item,
    required String text,
    required IconData icon,
  }) {
    final provider = Provider.of<NavigationProvider>(context);
    final currentItem = provider.navigationItem;
    final isSelected = item == currentItem;

    final color = isSelected ? Colors.orangeAccent : Colors.white;

    return Material(
      color: Colors.transparent,
      child: ListTile(
        selected: isSelected,
        selectedTileColor: Colors.white24,
        leading: Icon(icon, color: color),
        title: Text(text, style: TextStyle(color: color, fontSize: 16)),
        onTap: () => selectItem(context, item),
      ),
    );
  }

  void selectItem(BuildContext context, NavigationItem item) {
    final provider = Provider.of<NavigationProvider>(context, listen: false);
    provider.setNavigationItem(item);
  }

  Widget buildHeader(
    BuildContext context, {
    required String urlImage,
    required String name,
    required String email,
  }) =>
      Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
            child: Row(
              children: [
                CircleAvatar(
                    radius: 30, backgroundImage: NetworkImage(urlImage)),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
                // Spacer(),
                // CircleAvatar(
                //   radius: 24,
                //   backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                //   child: Icon(Icons.add_comment_outlined, color: Colors.white),
                // )
              ],
            ),
          ),
        ),
      );
}
