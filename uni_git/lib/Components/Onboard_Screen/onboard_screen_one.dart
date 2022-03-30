import 'package:flutter/material.dart';
import 'package:uni_git/Components/Onboard_Screen/onboard_screen_two.dart';
import 'package:uni_git/Components/Onboard_Screen/slanding_cliiper.dart';
import 'package:uni_git/Components/SplashScreen/splash_screen.dart';
import 'package:uni_git/Constatnt/constants.dart';

class OnboardScreenOne extends StatelessWidget {
  const OnboardScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
              ),
              Image(
                image: const AssetImage("assets/images/lib_back.png"),
                width: size.width,
                height: size.height * 0.5,
                fit: BoxFit.cover,
              ),
              ClipPath(
                clipper: SlandigClipper(),
                child: Container(
                  height: size.height * 0.4,
                  color: slandigColor,
                ),
              ),
            ],
          ),
          Positioned(
            top: size.height * 0.65,
            child: Container(
              width: size.width,
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "DIGITAL LIBRARY",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: white,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: black,
                      width: 2,
                    ),
                    shape: BoxShape.circle,
                    color: white,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: black,
                      width: 2,
                    ),
                    shape: BoxShape.circle,
                    color: slandigColor,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: black,
                      width: 2,
                    ),
                    shape: BoxShape.circle,
                    color: slandigColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    splashColor: const Color(0xFF41A58D),
                    // ignore: avoid_print
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SplashScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        color: black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: FloatingActionButton(
                    splashColor: const Color(0xFF41A58D),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const OnboardScreenTwo(),
                        ),
                      );
                    },
                    backgroundColor: white,
                    child: const Icon(
                      Icons.navigate_next_rounded,
                      color: black,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

