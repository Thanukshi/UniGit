import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_git/Components/Onboard_Screen/onboard_screen_one.dart';
import 'package:uni_git/Components/SplashScreen/splash_screen.dart';
import 'package:uni_git/provider/navigation_provider.dart';

int? initScreen;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  // ignore: await_only_futures
  initScreen = await sp.getInt('initScreen');
  await sp.setInt('initScreen', 1);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            // visualDensity: VisualDensity.adaptivePlatformDensity,
            dividerColor: Colors.black,
          ),
          home: const OnboardScreenOne(),
          initialRoute:
              initScreen == 0 || initScreen == null ? 'onboard' : 'home',
          routes: {
            'home': (context) => const SplashScreen(),
            'onboard': (context) => const OnboardScreenOne(),
          },
        ),
      );
}
