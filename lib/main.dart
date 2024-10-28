import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:nex_connect/helper/helper_function.dart';
import 'package:nex_connect/pages/home_page.dart';
import 'package:nex_connect/pages/login_page.dart';
import 'package:nex_connect/shared/constaints.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
if (kIsWeb) { 
} else {
}

  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    bool _isSignedIn = false;
getUserLoggedInStatus() async {
    await HelperFunction.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
          primaryColor: Constaints().primaryColor,
          scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: _isSignedIn ? const HomePage() : const LoginPage(),
    );
  }
}