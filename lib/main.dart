import 'package:flutter/material.dart';

import 'package:gunio/screens/home_screen.dart';
import 'package:gunio/screens/way_screen.dart';
import 'package:gunio/screens/who_screen.dart';
import 'package:gunio/ui/screens/auth/login.dart';
import 'package:gunio/screens/terms_of_use_screen.dart';

void main() {
  runApp(MyApp());
}

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Walt',
      theme: ThemeData(
        //primaryColor: Theme.of(context).primaryColor,
        colorScheme: ColorScheme.light(
          primary: Colors.black87,
          primaryVariant: Colors.black54,
          secondary: Colors.black45,
        ),
        //primarySwatch: primaryBlack,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white),
          //headline6: TextStyle(fontSize: 30.0, ),
          //bodyText2: TextStyle(fontSize: 14.0, ),
        ),
      ),
      home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/terms_of_use': (context) => const TermsOfUse(),
    }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      children: <Widget> [
        Center (
          child: HomeScreen(title: "Walt"),
        ),
        Center (
          child: WayScreen(),
        ),
        Center (
          child: WhoScreen(),
        )
      ],
    );
  }
}
