import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_git/model/navigation_item.dart';
import 'package:uni_git/page/favourites_page.dart';
import 'package:uni_git/page/followers.dart';
import 'package:uni_git/page/home.dart';
import 'package:uni_git/page/notifications_page.dart';
import 'package:uni_git/page/new_repo.dart';
import 'package:uni_git/page/plugins_page.dart';
import 'package:uni_git/page/repositories.dart';
import 'package:uni_git/page/updates_page.dart';
import 'package:uni_git/page/profile.dart';
import 'package:uni_git/page/users_page.dart';
import 'package:uni_git/provider/navigation_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => buildPages();

  Widget buildPages() {
    final provider = Provider.of<NavigationProvider>(context);
    final navigationItem = provider.navigationItem;

    switch (navigationItem) {
      case NavigationItem.home:
        return HomePage();
      case NavigationItem.newRepo:
        return const NewRepository();
      case NavigationItem.repositories:
        return RepositoriesPage();
      case NavigationItem.users:
        return UsersPage();
      case NavigationItem.followers:
        return const FollowersPage();
      case NavigationItem.favourites:
        return FavouritesPage();
      case NavigationItem.profile:
        return const ProfilePage();
      case NavigationItem.settings:
        return const UpdatesPage();
      case NavigationItem.plugins:
        return PluginsPage();
      case NavigationItem.notifications:
        return NotificationsPage();
    }
  }
}
