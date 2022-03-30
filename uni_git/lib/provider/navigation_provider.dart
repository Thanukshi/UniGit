import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:uni_git/model/navigation_items.dart';

class NavigationProvider extends ChangeNotifier {
  NavigationItems _navigationItem = NavigationItems.newRepo;

  NavigationItems get navigationItems => _navigationItem;

  //set navigationItem(NavigationItems navigationItem) {}

  void setNavigationItem(NavigationItems navigationItems) {
    _navigationItem = navigationItems;

    notifyListeners();
  }
}
