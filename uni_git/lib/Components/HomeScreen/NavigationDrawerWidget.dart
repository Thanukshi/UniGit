import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_git/model/navigation_items.dart';
import 'package:uni_git/provider/navigation_provider.dart';

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
                    item: NavigationItems.newRepo,
                    text: "New",
                    icon: Icons.new_label,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                    context,
                    item: NavigationItems.repositories,
                    text: "Repositories",
                    icon: Icons.list,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                    context,
                    item: NavigationItems.favorities,
                    text: "Favourities",
                    icon: Icons.favorite,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                    context,
                    text: "Followers",
                    item: NavigationItems.followers,
                    icon: Icons.follow_the_signs,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                    context,
                    item: NavigationItems.profile,
                    text: "Profile",
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 24),
                  Divider(color: Colors.white),
                  const SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                    context,
                    item: NavigationItems.settings,
                    text: "Settings",
                    icon: Icons.settings,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                    context,
                    item: NavigationItems.pluggins,
                    text: "Pluggins",
                    icon: Icons.account_tree,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                    context,
                    item: NavigationItems.notifications,
                    text: "Notifications",
                    icon: Icons.notifications,
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  buildMenuItem(
    BuildContext context, {
    required NavigationItems item,
    required String text,
    required IconData icon,
  }) {
    final provider = Provider.of<NavigationProvider>(context);
    final currentItem = provider.navigationItems;
    final isSelected = item == currentItem;

    final color = Colors.white;
    return Material(
      color: Colors.transparent,
      child: ListTile(
        selected: isSelected,
        selectedTileColor: Colors.white24,
        leading: Icon(icon, color: color),
        title: Text(text, style: TextStyle(color: color, fontSize: 18)),
        onTap: () => selectItem(context, item),
      ),
    );
  }

  void selectItem(BuildContext context, NavigationItems item) {
    final provider = Provider.of<NavigationProvider>(context, listen: false);
    provider.setNavigationItem(item);
  }
}
