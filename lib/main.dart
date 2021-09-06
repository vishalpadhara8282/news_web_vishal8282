import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'inject/injector.dart';
import 'screen/homepage.dart';

void main() => setupLocator();

Future setupLocator() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.getInstance();
  await Firebase.initializeApp();
  // FirebaseApp app = await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String getFirstTimeOpen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getFirstTimeOpen = Injector.prefs.get(StringResHindi.firstTimeOpen);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,
        theme: ThemeData (
          // Define the default brightness and colors.
//          brightness: Brightness.dark,
          primaryColor: Colors.deepPurple,
//          accentColor: Colors.cyan[600],

          // Define the default font family.
          fontFamily: 'Georgia',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme (
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
//      home: getFirstTimeOpen != null ? HomePage() : Splash(),
      home: HomePage(),
        /*routes: {
          '/home': (BuildContext context) => HomePage(),
          '/splash': (BuildContext context) => Splash(),
        }*/
    );
  }
}

//laughable