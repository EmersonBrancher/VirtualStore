import 'package:flutter/material.dart';
import 'package:virtual_store/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:virtual_store/screens/login_screen.dart';
import 'package:virtual_store/screens/signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Brutal Kill",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 4, 125, 141)
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      );
  }
}
