import 'package:flutter/material.dart';
import 'package:uni_git/widget/navigation_drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: non_constant_identifier_names
  Material MyItems(IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: const Color(0x80219EF3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //text
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      heading,
                      style: TextStyle(
                        color: Color(color),
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  //Icon
                  Material(
                    color: Color(color),
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'Nisebuschgardens',
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF41A58D),
      ),
      body: GridView.count(
        padding: const EdgeInsets.only(
            left: 30.0, right: 30.0, bottom: 35.0, top: 55.0),
        crossAxisCount: 2,
        children: const <Widget>[
          HomeMenu(
            title: "Issues",
            icon: Icons.report_problem,
            iconColor: Colors.brown,
          ),
          HomeMenu(
            title: "Pull Requests",
            icon: Icons.account_tree,
            iconColor: Colors.blue,
          ),
          HomeMenu(
            title: "Discussions",
            icon: Icons.chat,
            iconColor: Colors.orange,
          ),
          HomeMenu(
            title: "Repositories",
            icon: Icons.list,
            iconColor: Colors.red,
          ),
          HomeMenu(
            title: "Organizations",
            icon: Icons.home_max,
            iconColor: Colors.green,
          ),
          HomeMenu(
            title: "Notifications",
            icon: Icons.notifications,
            iconColor: Colors.cyan,
          ),
        ],
      ),
    );
  }
}

class HomeMenu extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const HomeMenu({
    required this.title,
    required this.icon,
    required this.iconColor,
  });

  final String title;
  final IconData icon;
  final MaterialColor iconColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        splashColor: const Color(0xFF14DDAF),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 70.0,
                color: iconColor,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 17.0, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
