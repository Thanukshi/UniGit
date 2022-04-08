import 'package:flutter/material.dart';
import 'package:uni_git/Constatnt/constants.dart';
import 'package:uni_git/widget/navigation_drawer_widget.dart';

class RepositoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text(
            'Repositories',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'Nisebuschgardens',
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF41A58D),
        ),
        body: getBody(),
      );

  Widget getBody() {
    return ListView.builder(itemBuilder: (context, index) {
      index = index + 1;
      String indexNo = index.toString();
      return getCard(indexNo);
    });
  }

  Widget getCard(String item) {
    // var fullName = item['user_name'];
    // var email = item['user_email'];
    // var profileUrl = item['user_image'];
    return Card(
        elevation: 1.5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            onTap: () {},
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.all(2.0),
                  child: Text(item,
                      style: const TextStyle(fontSize: 17),
                      textAlign: TextAlign.left),
                ),
                // Container(
                //   width: 60,
                //   height: 60,
                //   margin: const EdgeInsets.all(2.0),
                //   padding: const EdgeInsets.all(2.0),
                //   decoration: BoxDecoration(
                //       color: primary,
                //       borderRadius: BorderRadius.circular(60 / 2),
                //       image: DecorationImage(
                //           fit: BoxFit.cover, image: NetworkImage(profileUrl))),
                // ),
                const SizedBox(width: 30),
                Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.all(2.0),
                  child: const Text("Repo 1",
                      style: TextStyle(fontSize: 17),
                      textAlign: TextAlign.left),
                ),
                const SizedBox(width: 30),
                Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(2.0),
                  child: const Icon(
                    Icons.edit,
                    color: Color(0xFF276955),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.all(2.0),
                  padding: const EdgeInsets.all(3.0),
                  child: const Icon(
                    Icons.cancel_sharp,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
